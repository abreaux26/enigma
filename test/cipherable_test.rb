require './test/test_helper'
require './lib/cipherable'

class MockEncrypt
  include Cipherable
end

class CipherableTest < Minitest::Test
  def setup
    @encrypt = MockEncrypt.new
    @decrypt = MockEncrypt.new
  end

  def test_it_exists
    assert_instance_of MockEncrypt, @encrypt
  end

  def character_set
    expected = ('a'..'z').to_a << ' '
    assert_equal expected, @encrypt.character_set
  end

  def test_index_of_character
    assert_equal 7, @encrypt.index_of_character('h')
  end

  def test_shift_character_set_encrypt
    expected = [
      'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l',
      'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u',
      'v', 'w', 'x', 'y', 'z', ' ', 'a', 'b', 'c'
     ]
    assert_equal expected, @encrypt.shift_character_set(3)
  end

  def test_shift_character_set_decrypt
    expected = [
      'y', 'z', ' ', 'a', 'b', 'c', 'd', 'e', 'f',
      'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o',
      'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x'
    ]
    assert_equal expected, @decrypt.shift_character_set(-3)
  end

  def test_encrypt_character
    assert_equal 'k', @encrypt.cipher_character(3, 'h')
  end

  def test_decrypt_character
    assert_equal 'h', @encrypt.cipher_character(-3, 'k')
  end

  def test_encrypt_character_nil
    assert_equal '!', @encrypt.cipher_character(20, '!')
  end

  def test_decrypt_character_nil
    assert_equal '!', @decrypt.cipher_character(-20, '!')
  end
end
