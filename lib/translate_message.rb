require_relative 'cipherable'

class TranslateMessage
  include Cipherable

  attr_reader :phrase,
              :key,
              :date

  def initialize(phrase, key, date)
    @phrase = phrase.downcase
    @key = key
    @date = date
  end

  def encrypt
    {
      encryption: translate_phrase('encrypt'),
      key: @key,
      date: @date
    }
  end

  def decrypt
    {
      decryption: translate_phrase('decrypt'),
      key: @key,
      date: @date
    }
  end

  def split_phrase
    @phrase.split('')
  end

  def split_key
    @key.split('')
  end

  def key_values
    split_key.each_cons(2).map do |key1, key2|
      "#{key1}#{key2}"
    end
  end

  def key_offset_values_encrypt
    key_values.each_with_index.map do |key, index|
      key.to_i + offset[index].to_i
    end
  end

  def key_offset_values_decrypt
    key_offset_values_encrypt.map do |key|
      key * -1
    end
  end

  def translate_phrase(shift_type)
    index = 0
    split_phrase.reduce('') do |new_phrase, letter|
      index = 0 if index == 4
      new_phrase += convert_letter(letter, index, shift_type)
      index += 1
      new_phrase
    end
  end

  def convert_letter(letter, index, shift_type)
    if shift_type == 'encrypt'
      encrypt_character(key_offset_values_encrypt[index], letter)
    else
      encrypt_character(key_offset_values_decrypt[index], letter)
    end
  end

  def offset
    (@date.to_i ** 2).to_s[-4..-1]
  end
end
