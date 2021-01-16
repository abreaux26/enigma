require_relative 'cipher'
require_relative 'randomable'

class Encrypt
  include Cipher
  include Randomable

  attr_reader :phrase,
              :key,
              :date

  def initialize(phrase, key, date)
    @phrase = phrase.downcase
    @key = key
    @date = date
  end

  def key
    if @key == 0
      @key = random_number
    else
      @key
    end
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

  def encrypt
    {
      encryption: phrase_encryption,
      key: @key,
      date: @date
    }
  end

  def phrase_encryption
    count = 0
    @phrase.split('').reduce("") do |new_phrase, letter|
      count += 1
      new_phrase += encrypt_character(shift(count), letter)
      count = 0 if count == 4
      new_phrase
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
