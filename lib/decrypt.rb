require_relative 'enigma'

file = File.open(ARGV[0])
message_to_decrypt = file.read.chomp
key = ARGV[2]
date = ARGV[3]
enigma = Enigma.new
decrypt_hash = enigma.decrypt(message_to_decrypt, key, date)
write_to_file = ARGV[1]
decrypted =  File.write(write_to_file, decrypt_hash[:decryption])
puts "Created '#{write_to_file}' with the key #{key} and date #{date}"
