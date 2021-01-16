require_relative 'encrypt_message'
require 'date'

class Enigma
  def self.encrypt(message, key = 0, date = Date.today.strftime('%d%m%y'))
    EncryptMessage.new(message, key, date).encrypt
  end
end
