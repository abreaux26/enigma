require './test/test_helper'
require './lib/cipher'

class CipherTest < Minitest::Test
  def setup
    @cipher = Cipher.new("h", 3)
  end

  def test_it_exists
    assert_instance_of Cipher, @cipher
  end

  def test_it_has_readable_attributes
    assert_equal "h", @cipher.letter
    assert_equal 3, @cipher.shift_value
    assert_equal ("a".."z").to_a << " ", @cipher.character_set
  end

  def test_index_of_character
    assert_equal 7, @cipher.index_of_character
  end

  def test_shift_character_set
    expected = [
      "d", "e", "f", "g", "h", "i", "j", "k", "l",
      "m", "n", "o", "p", "q", "r", "s", "t", "u",
      "v", "w", "x", "y", "z", " ", "a", "b", "c"
     ]
    assert_equal expected, @cipher.shift_character_set
  end
end
