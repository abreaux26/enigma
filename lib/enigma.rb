require_relative 'encrypt_message'
require_relative 'decrypt_message'
require_relative 'randomable'

class Enigma
  include Randomable

  def self.encrypt(message, key = random_number, date = Date.today.strftime('%d%m%y'))
    EncryptMessage.new(message, key, date).encrypt
  end

  def self.decrypt(message, key, date)
    DecryptMessage.new(message, key, date).decrypt
  end
end
