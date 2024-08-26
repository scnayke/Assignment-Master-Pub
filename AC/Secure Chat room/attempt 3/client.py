import threading
import socket
import rsa

# RSA key generation
public_key, private_key = rsa.newkeys(1024)

def receive_messages(client):
    while True:
        try:
            encrypted_msg = client.recv(1024)
            if not encrypted_msg:
                break
            # Decrypt and display the received message
            message = rsa.decrypt(encrypted_msg, private_key).decode('utf-8')
            print(message)
        except Exception as e:
            print(f"Error receiving message: {e}")
            break

# Connect to the server
SERVER = "localhost"  # Replace with server IP
PORT = 1234
client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
client.connect((SERVER, PORT))

# Exchange public keys with the server
server_public_key = rsa.PublicKey.load_pkcs1(client.recv(1024))
client.send(public_key.save_pkcs1("PEM"))

# Enter the username
username = input("Enter your username: ")

# Send the username to the server
client.send(rsa.encrypt(username.encode('utf-8'), server_public_key))

# Start a thread to receive messages
receive_thread = threading.Thread(target=receive_messages, args=(client,))
receive_thread.start()

# Sending messages
while True:
    try:
        message = input()
        if message.lower() == "quit":
            client.close()
            break
        full_message = f"{username}: {message}"
        encrypted_message = rsa.encrypt(full_message.encode('utf-8'), server_public_key)
        client.send(encrypted_message)
    except Exception as e:
        print(f"Error sending message: {e}")
        break
