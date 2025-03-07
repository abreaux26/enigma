require_relative 'enigma'

read_file = File.open(ARGV[0])
write_file = ARGV[1]
key = ARGV[2]
date = ARGV[3]

if key.nil?
  return puts 'Error! Need key to decrypt!'
end

ciphertext = read_file.read.chomp
enigma = Enigma.new

if date.nil?
  decrypted = enigma.decrypt(ciphertext, key)
else
  decrypted = enigma.decrypt(ciphertext, key, date)
end

decryption = decrypted[:decryption]
key = decrypted[:key]
date = decrypted[:date]

File.write(write_file, decryption)
puts "Created '#{write_file}' with the key #{key} and date #{date}"
