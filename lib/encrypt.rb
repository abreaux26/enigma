require_relative 'enigma'

file = File.open(ARGV[0])
message_to_encrypt = file.read.chomp
encrypt_hash = Enigma.encrypt(message_to_encrypt, "02715", "040895")
write_to_file = ARGV[1]
encrypted =  File.write(write_to_file, encrypt_hash[:encryption])
puts "Created #{write_to_file} with the key #{encrypt_hash[:key]} and date #{encrypt_hash[:date]}"
