require_relative 'enigma'

file = File.open(ARGV[0])
message_to_encrypt = file.read.chomp
enigma = Enigma.new
encrypt_hash = enigma.encrypt(message_to_encrypt)
write_to_file = ARGV[1]
encrypted =  File.write(write_to_file, encrypt_hash[:encryption])
puts "Created '#{write_to_file}' with the key #{encrypt_hash[:key]} and date #{encrypt_hash[:date]}"
