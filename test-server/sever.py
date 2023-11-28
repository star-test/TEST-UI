import socket

# 定义服务器的主机和端口
HOST = '127.0.0.1'  # 本地主机地址
PORT = 8080  # 端口号

# 创建一个socket对象
server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# 将socket对象绑定到指定的主机和端口
server_socket.bind((HOST, PORT))

# 开始监听客户端连接
server_socket.listen(1)
print('服务器已启动，等待客户端连接...')

# 等待客户端连接
client_socket, addr = server_socket.accept()
print('客户端已连接:', addr)

while True:
    # 接收客户端发送的数据
    data = client_socket.recv(1024).decode()

    if not data:
        break

    print('收到客户端的请求:', data)

    # 向客户端发送响应数据
    response = '欢迎访问服务器！'
    client_socket.sendall(response.encode())

# 关闭客户端连接
client_socket.close()

# 关闭服务器连接
server_socket.close()
