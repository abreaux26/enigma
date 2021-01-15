class Encrypt
  attr_reader :phrase,
              :key,
              :date

  def initialize(phrase, key, date = Time.now)
    @phrase = phrase
    @key = key
    @date = date
  end

  def a_shift
    @key[0..1]
  end

  def b_shift
    @key[1..2]
  end

  def c_shift
    @key[2..3]
  end

  def d_shift
    @key[3..4]
  end
end
