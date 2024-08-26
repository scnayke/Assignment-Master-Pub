import threading
import socket
import rsa
import sys

# Generate RSA keys for the server
public_key, private_key = rsa.newkeys(1024)
active_clients = {}
server_running = True  # A flag to control the server loop

def serve_client(client, addr):
    try:
        # Exchange public keys with the client
        client.send(public_key.save_pkcs1("PEM"))
        client_public_key = rsa.PublicKey.load_pkcs1(client.recv(1024))
        active_clients[client] = client_public_key  # Store the client's public key

        # First message from client is their username
        username = rsa.decrypt(client.recv(1024), private_key).decode('utf-8')
        join_message = f"{username} has joined the chat!"
        broadcast_clients(join_message, client)

        while server_running:
            try:
                encrypted_msg = client.recv(1024)
                if not encrypted_msg:
                    break

                # Decrypt the received message
                message = rsa.decrypt(encrypted_msg, private_key).decode('utf-8')
                print(f"{addr} ({username}): {message}")

                # Broadcast the encrypted message to all other clients
                broadcast_clients(f"{username}: {message}", client)

            except Exception as e:
                print(f"Error while serving {addr}: {e}")
                break

    finally:
        leave_message = f"{username} has left the chat."
        broadcast_clients(leave_message, client)
        print(f"Connection with {addr} has been closed.")
        del active_clients[client]  # Remove the client
        client.close()

def broadcast_clients(msg, sending_client=None):
    for client, client_public_key in active_clients.items():
        if client is not sending_client:
            try:
                encrypted_msg = rsa.encrypt(msg.encode('utf-8'), client_public_key)
                client.send(encrypted_msg)
            except Exception as e:
                print(f"Error while broadcasting to a client: {e}")

def shutdown_server():
    global server_running
    print("Shutting down server...")
    server_running = False
    for client in active_clients.keys():
        client.close()
    server.close()
    sys.exit(0)

# Server setup
SERVER = "0.0.0.0"  # Listen on all network interfaces
PORT = 1234
server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.bind((SERVER, PORT))
server.listen()

print(f"Server is listening on port {PORT}...")

try:
    while server_running:
        try:
            server.settimeout(1)  # Set a timeout to periodically check the server_running flag
            client, addr = server.accept()
            print(f"Connection established with {addr}")

            client_thread = threading.Thread(target=serve_client, args=(client, addr))
            client_thread.start()
        except socket.timeout:
            continue  # Continue looping to check the server_running flag
except KeyboardInterrupt:
    shutdown_server()
finally:
    server.close()
