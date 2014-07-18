require "socket"

STDOUT.sync = true
STDERR.sync = true

server = TCPServer.new ARGV[0]
loop do
  Thread.start(server.accept) do |client|
    begin
      while line = client.gets
        puts line
      end

    rescue => e
      STDERR.puts e.inspect

    ensure
      client.close  
    end
  end
end
