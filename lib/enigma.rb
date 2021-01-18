require_relative 'translate_message'
require_relative 'randomable'
require 'date'

class Enigma
  include Randomable

  def encrypt(message, key = random_number, date = Date.today.strftime('%d%m%y'))
    TranslateMessage.new(message, key, date).encrypt
  end

  def decrypt(ciphertext, key, date = Date.today.strftime('%d%m%y'))
    TranslateMessage.new(ciphertext, key, date).decrypt
  end
end
