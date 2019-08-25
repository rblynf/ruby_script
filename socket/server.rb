require 'socket'               # 获取socket标准库
 
server = TCPServer.open(2000)  # Socket 监听端口为 2000

# loop {                         # 永久运行服务
#   client = server.accept       # 等待客户端连接
#   client.puts(Time.now.ctime)  # 发送时间到客户端
#   client.puts "Closing the connection. Bye!"
#   client.close                 # 关闭客户端连接
# }

 # 在这个例子中，socket永久运行，而当server.accept接收到客户端的连接时，
 # 一个新的线程被创建并立即开始处理请求。而主程序立即循环回，并等待新的连接。
loop {                          # 永久运行服务
  Thread.start(server.accept) do |client|
    client.puts(Time.now.ctime) # 发送时间到客户端
    client.puts "Closing the connection. Bye!"
    client.close                # 关闭客户端连接
  end
}