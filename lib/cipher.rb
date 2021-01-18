module Cipher
  def character_set
    ("a".."z").to_a << " "
  end

  def index_of_character(letter)
    character_set.index(letter)
  end

  def shift_character_set(shift_value)
   character_set.rotate(shift_value).to_a
  end

  def encrypt_character(shift_value, letter)
    shift_character_set(shift_value)[index_of_character(letter)]
  end
end
