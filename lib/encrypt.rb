class Encrypt
  attr_reader :phrase,
              :key,
              :date,
              :character_set

  def initialize(phrase, key, date = Date.today.strftime('%d%m%y'))
    @phrase = phrase
    @key = key
    @date = date
    @character_set = ("a".."z").to_a << " "
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
      encryption: "keder ohulw",
      key: @key,
      date: @date
    }
  end
end
