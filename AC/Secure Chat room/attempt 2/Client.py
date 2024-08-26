import threading
import socket
import rsa

# Generate RSA keys for the client
public_key, private_key = rsa.newkeys(1024)

def receive_messages(client):
    while True:
        try:
            encrypted_msg = client.recv(1024)
            if not encrypted_msg:
                break

            # Decrypt the received message
            message = rsa.decrypt(encrypted_msg, private_key).decode('utf-8')
            print(f"\nPartner: {message}\n>>", end='')
        except Exception as e:
            print(f"Error while receiving message: {e}")
            break

# Client setup
SERVER = "192.168.29.229"  # Replace with the server's local IP address
PORT = 1234
client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
client.connect((SERVER, PORT))

# Exchange public keys with the server
server_public_key = rsa.PublicKey.load_pkcs1(client.recv(1024))  # Receive server's public key
client.send(public_key.save_pkcs1("PEM"))  # Send client's public key

# Start a thread to receive messages
receive_thread = threading.Thread(target=receive_messages, args=(client,))
receive_thread.start()

while True:
    message = input(">> ")
    if message.lower() == "quit":
        break

    try:
        # Encrypt the message before sending
        encrypted_msg = rsa.encrypt(message.encode('utf-8'), server_public_key)
        client.send(encrypted_msg)
    except Exception as e:
        print(f"Error while sending message: {e}")
        break

client.close()
