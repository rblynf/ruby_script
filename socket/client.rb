require 'socket'      # Sockets 是标准库
 
hostname = 'localhost'
port = 2000
 
s = TCPSocket.open(hostname, port)
 
while line = s.gets   # 从 socket 中读取每行数据
  puts line.chop      # 打印到终端
end
s.close               # 关闭 socket