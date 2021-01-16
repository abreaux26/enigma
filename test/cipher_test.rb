require './test/test_helper'
require './lib/cipher'

class MockEncrypt
  include Cipher
end

class CipherTest < Minitest::Test
  def setup
    @encrypt = MockEncrypt.new
  end

  def test_it_exists
    assert_instance_of MockEncrypt, @encrypt
  end

  def test_index_of_character
    assert_equal 7, @encrypt.index_of_character('h')
  end

  def test_shift_character_set
    expected = [
      'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l',
      'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u',
      'v', 'w', 'x', 'y', 'z', ' ', 'a', 'b', 'c'
     ]
    assert_equal expected, @encrypt.shift_character_set(3)
  end

  def test_encrypt_character
    assert_equal 'k', @encrypt.encrypt_character(3, 'h')
  end
end
