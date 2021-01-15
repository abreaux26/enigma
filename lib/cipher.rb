class Cipher
  attr_reader :letter,
              :shift_value,
              :character_set

  def initialize(letter, shift_value)
    @letter = letter
    @shift_value = shift_value
    @character_set = ("a".."z").to_a << " "
  end

  def index_of_character
    @character_set.index(@letter)
  end
end
