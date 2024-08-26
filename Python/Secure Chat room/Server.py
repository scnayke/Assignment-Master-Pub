import threading
import socket
import rsa
import signal
import sys

# Generate RSA keys for the server
public_key, private_key = rsa.newkeys(1024)
active_clients = {}

def serve_client(client, addr):
    try:
        # Exchange public keys with the client
        client.send(public_key.save_pkcs1("PEM"))
        client_public_key = rsa.PublicKey.load_pkcs1(client.recv(1024))
        active_clients[client] = client_public_key  # Store the client's public key

        while True:
            try:
                encrypted_msg = client.recv(1024)
                if not encrypted_msg:
                    break

                # Decrypt the received message
                message = rsa.decrypt(encrypted_msg, private_key).decode('utf-8')
                print(f"{addr}: {message}")

                # Broadcast the encrypted message to all other clients
                broadcast_clients(message, client)

            except Exception as e:
                print(f"Error while serving {addr}: {e}")
                break

    finally:
        print(f"Connection with {addr} has been closed.")
        del active_clients[client]  # Remove the client
        client.close()

def broadcast_clients(msg, sending_client):
    for client, client_public_key in active_clients.items():
        if client is not sending_client:
            try:
                encrypted_msg = rsa.encrypt(msg.encode('utf-8'), client_public_key)
                client.send(encrypted_msg)
            except Exception as e:
                print(f"Error while broadcasting to a client: {e}")

def shutdown_server(signal, frame):
    print("Shutting down server...")
    for client in active_clients.keys():
        client.close()
    server.close()
    sys.exit(0)

# Set up signal handling
signal.signal(signal.SIGINT, shutdown_server)  # Handle Ctrl+C

# Server setup
SERVER = "0.0.0.0"  # Listen on all network interfaces
PORT = 1234
server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.bind((SERVER, PORT))
server.listen()

print(f"Server is listening on port {PORT}...")

while True:
    try:
        client, addr = server.accept()
        print(f"Connection established with {addr}")

        client_thread = threading.Thread(target=serve_client, args=(client, addr))
        client_thread.start()
    except Exception as e:
        print(f"Server error: {e}")

# Server is closed (not reachable in normal flow due to while True loop)
server.close()