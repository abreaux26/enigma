require_relative 'encrypt_message'

class Enigma
  def encrypt(message, key = 0, date = Date.today.strftime('%d%m%y'))
    EncryptMessage.new(message, key, date).encrypt
  end
end
