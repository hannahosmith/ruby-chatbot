require 'socket'

server = 'irc.freenode.net'
port = 6667
socket = TCPSocket.open(server,port)

nickname = 'grandpa_joe'
channel = '#wonkav8r'

socket.puts "NICK #{nickname}"
socket.puts "USER #{nickname} 0 * #{nickname}"
socket.puts "JOIN #{channel}"

# socket.puts "PRIVMSG #{channel} :hey Charlie where did that weird man with the hat go?"

while message = socket.gets do
  puts message

  if message.match('^PING')
    server = message.split(':').last
    puts "PONG #{server}"
    socket.puts "PONG #{server}"
  end

  if message.downcase.match('hey')
    puts "hey there"
    socket.puts "PRIVMSG #{channel} :hey there"
  end

  if message.downcase.match('how are you?')
    puts "I'm fine boy. How r u"
    socket.puts "PRIVMSG #{channel} :I'm fine boy. How r u"
  end

end

# puts socket.gets
