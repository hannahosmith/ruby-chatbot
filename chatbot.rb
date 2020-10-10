require 'socket'

server = 'irc.freenode.net'
port = 6667
socket = TCPSocket.open(server,port)

nickname = 'grandpa_joe'

socket.puts "NICK #{nickname}"
socket.puts "USER #{nickname} 0 * #{nickname}"

while message = socket.gets do
  puts message
end
