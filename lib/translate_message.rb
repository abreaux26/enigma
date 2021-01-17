require_relative 'cipher'

class TranslateMessage
  include Cipher

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
      encryption: translate_phrase("encrypt"),
      key: @key,
      date: @date
    }
  end

  def decrypt
    {
      decryption: translate_phrase("decrypt"),
      key: @key,
      date: @date
    }
  end

  def offset
    (@date.to_i ** 2).to_s[-4..-1]
  end

  def a_shift
    @key[0..1].to_i + offset[0].to_i
  end

  def b_shift
    @key[1..2].to_i + offset[1].to_i
  end

  def c_shift
    @key[2..3].to_i + offset[2].to_i
  end

  def d_shift
    @key[3..4].to_i + offset[3].to_i
  end

  def translate_phrase(shift_type)
    count = 1
    split_phrase.reduce("") do |new_phrase, letter|
      new_phrase += convert_letter(letter, count, shift_type)
      count = 0 if count == 4
      count += 1
      new_phrase
    end
  end

  def split_phrase
    @phrase.split('')
  end

  def convert_letter(letter, count, shift_type)
    if shift_type == "encrypt"
      encrypt_character(shift(count), letter)
    else
      encrypt_character(-shift(count), letter)
    end
  end

  def shift(count)
    case count
    when 1
      a_shift
    when 2
      b_shift
    when 3
      c_shift
    when 4
      d_shift
    end
  end
end
