module Cipherable
  def character_set
    @_character_set ||= ('a'..'z').to_a << ' '
  end

  def index_of_character(character)
    character_set.index(character)
  end

  def shift_character_set(shift_value)
   character_set.rotate(shift_value).to_a
  end

  def cipher_character(shift_value, character)
    if index_of_character(character).nil?
      character
    else
      shift_character_set(shift_value)[index_of_character(character)]
    end
  end
end
