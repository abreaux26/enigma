require './test/test_helper'
require './lib/translate_message'

class TranslateMessageTest < Minitest::Test
  def setup
    @encrypt = TranslateMessage.new('hello world', '02715', '040895')
    @decrypt = TranslateMessage.new('keder ohulw', '02715', '040895')
  end

  def test_it_exists
    assert_instance_of TranslateMessage, @encrypt
    assert_instance_of TranslateMessage, @decrypt
  end

  def test_split_key
    expected_keys = ['0', '2', '7', '1', '5']

    assert_equal expected_keys, @encrypt.split_key
    assert_equal expected_keys, @decrypt.split_key
  end

  def test_key_values
    expected_keys = ['02', '27', '71', '15']

    assert_equal expected_keys, @encrypt.key_values
    assert_equal expected_keys, @decrypt.key_values
  end

  def test_offset
    assert_equal '1025', @encrypt.offset
    assert_equal '1025', @decrypt.offset
  end

  # Encryption Tests

  def test_it_has_readable_attributes_encrypt
    assert_equal 'hello world', @encrypt.phrase
    assert_equal '02715', @encrypt.key
    assert_equal '040895', @encrypt.date
  end

  def test_encrypt
    expected = {
      encryption: 'keder ohulw',
      key: '02715',
      date: '040895'
    }

    assert_equal expected, @encrypt.encrypt
  end

  def test_split_phrase_encrypt
    expected_encrypt = ['h', 'e', 'l', 'l', 'o', ' ', 'w', 'o', 'r', 'l', 'd']

    assert_equal expected_encrypt, @encrypt.split_phrase
  end

  def test_encryption_shifts
    expected = [3, 27, 73, 20]

    assert_equal expected, @encrypt.encryption_shifts
  end

  def test_translate_phrase_encrypt
    assert_equal 'keder ohulw', @encrypt.translate_phrase('encrypt')
  end

  def test_convert_letter_encrypt
    assert_equal 'k', @encrypt.convert_letter('encrypt', 0, 'h')
  end

  # Decryption Tests

  def test_it_has_readable_attributes_decrypt
    assert_equal 'keder ohulw', @decrypt.phrase
    assert_equal '02715', @decrypt.key
    assert_equal '040895', @decrypt.date
  end

  def test_decrypt
    expected = {
      decryption: 'hello world',
      key: '02715',
      date: '040895'
    }

    assert_equal expected, @decrypt.decrypt
  end

  def test_split_phrase_decrypt
    expected_decrypt = ['k', 'e', 'd', 'e', 'r', ' ', 'o', 'h', 'u', 'l', 'w']

    assert_equal expected_decrypt, @decrypt.split_phrase
  end

  def test_decryption_shifts
    expected = [-3, -27, -73, -20]

    assert_equal expected, @decrypt.decryption_shifts
  end

  def test_translate_phrase_decrypt
    assert_equal 'hello world', @decrypt.translate_phrase('decrypt')
  end

  def test_convert_letter_encrypt
    assert_equal 'h', @decrypt.convert_letter('decrypt', 0, 'k')
  end
end
