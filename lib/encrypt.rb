require_relative 'enigma'

read_file = File.open(ARGV[0])
write_file = ARGV[1]

enigma = Enigma.new
message_to_encrypt = read_file.read.chomp

encrypted = enigma.encrypt(message_to_encrypt)

encryption = encrypted[:encryption]
key = encrypted[:key]
date = encrypted[:date]

File.write(write_file, encryption)
puts "Created '#{write_file}' with the key #{key} and date #{date}"
