require_relative 'translate_message'
require_relative 'randomable'

class Enigma
  include Randomable

  def self.encrypt(message, key = random_number, date = Date.today.strftime('%d%m%y'))
    TranslateMessage.new(message, key, date).encrypt
  end

  def self.decrypt(ciphertext, key, date)
    TranslateMessage.new(ciphertext, key, date).decrypt
  end
end
