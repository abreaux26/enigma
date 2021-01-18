require_relative 'enigma'

file = File.open(ARGV[0])
message_to_decrypt = file.read.chomp
key = ARGV[2]
date = ARGV[3]
enigma = Enigma.new
if key.nil?
  return puts "Error! Need key to decrypt!"
end
if date.nil?
  decrypt_hash = enigma.decrypt(message_to_decrypt, key)
else
  decrypt_hash = enigma.decrypt(message_to_decrypt, key, date)
end
write_to_file = ARGV[1]
decrypted =  File.write(write_to_file, decrypt_hash[:decryption])
puts "Created '#{write_to_file}' with the key #{decrypt_hash[:key]} and date #{decrypt_hash[:date]}"
