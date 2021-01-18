require_relative 'enigma'

read_file = File.open(ARGV[0])
write_file = ARGV[1]
key = ARGV[2]

if key.nil?
  return puts 'Error! Need key to decrypt!'
end

date = ARGV[3]
enigma = Enigma.new
ciphertext = read_file.read.chomp

if date.nil?
  decrypted = enigma.decrypt(ciphertext, key)
else
  decrypted = enigma.decrypt(ciphertext, key, date)
end

File.write(write_file, decrypted[:decryption])
puts "Created '#{write_file}' with the key #{decrypted[:key]} and date #{decrypted[:date]}"
