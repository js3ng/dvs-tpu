import numpy as np
import socket


def make_udp_server(port_num):
    """Starts a UDP server to receive info from jAER
    """
    ip_address = "127.0.0.1"
    server_sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    server_sock.bind((ip_address, port_num))
    #logging.info("Server started and listening for jAER commands")
    return server_sock


def send_message_udp(message, port_num):
    """Starts a UDP client to send info to jAER
    """
    ip_address = "127.0.0.1"
    client_sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    client_sock.sendto(message, (ip_address, port_num))

if __name__ == '__main__':
    port_num = 22
    server_sock = make_udp_server(port_num)
    print("Created UDP Server", vars(server_sock.__dict__), "at port number", str(port_num))
    
    message = "Hello"
    send_message_udp(message, port_num)
    print("Message sent to UDP Client")

