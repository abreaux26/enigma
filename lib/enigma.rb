require_relative 'encrypt'

class Enigma
  def encrypt(message, key = 0, date = Date.today.strftime('%d%m%y')
    Encrypt.new(message, key, date)
  end
end
