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
    @_split_phrase ||= @phrase.split('')
  end

  def split_key
    @_split_key ||= @key.split('')
  end

  def consecutive_keys
    @_consecutive_keys ||= split_key.each_cons(2)
  end

  def key_values
    consecutive_keys.map do |key1, key2|
      "#{key1}#{key2}"
    end
  end

  def index_key_values
    @_index_key_values ||= key_values.each_with_index
  end

  def offset
    @_offset ||= (@date.to_i ** 2).to_s[-4..-1]
  end

  def encryption_shifts
    index_key_values.map do |key, index|
      key.to_i + offset[index].to_i
    end
  end

  def decryption_shifts
    encryption_shifts.map do |key|
      key * -1
    end
  end

  def translate_phrase(shift_type)
    index = 0
    split_phrase.reduce('') do |new_phrase, character|
      index = 0 if index == 4
      new_phrase += convert_letter(shift_type, index, character)
      index += 1
      new_phrase
    end
  end

  def convert_letter(shift_type, index, character)
    if shift_type == 'encrypt'
      cipher_character(encryption_shifts[index], character)
    else
      cipher_character(decryption_shifts[index], character)
    end
  end
end
