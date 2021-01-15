class Encrypt
  attr_reader :phrase,
              :key,
              :date

  def initialize(phrase, key, date = Time.now)
    @phrase = phrase
    @key = key
    @date = date
  end
end
