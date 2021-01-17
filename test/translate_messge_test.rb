require './test/test_helper'
require './lib/translate_message'

class TranslateMessageTest < Minitest::Test
  def setup
    @encrypt = TranslateMessage.new("hello world", "02715", "040895")
    @decrypt = TranslateMessage.new("keder ohulw", "02715", "040895")
  end

  def test_it_exists
    assert_instance_of TranslateMessage, @encrypt
    assert_instance_of TranslateMessage, @decrypt
  end

  def test_it_has_readable_attributes_encrypt
    assert_equal "hello world", @encrypt.phrase
    assert_equal "02715", @encrypt.key
    assert_equal "040895", @encrypt.date
  end

  def test_it_has_readable_attributes_decrypt
    assert_equal "keder ohulw", @decrypt.phrase
    assert_equal "02715", @decrypt.key
    assert_equal "040895", @decrypt.date
  end

  def test_offset
    assert_equal "1025", @encrypt.offset
  end

  def test_a_shift
    assert_equal 3, @encrypt.a_shift
  end

  def test_b_shift
    assert_equal 27, @encrypt.b_shift
  end

  def test_c_shift
    assert_equal 73, @encrypt.c_shift
  end

  def test_d_shift
    assert_equal 20, @encrypt.d_shift
  end

  def test_encrypt
    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }

    assert_equal expected, @encrypt.encrypt
  end

  def test_decrypt
    expected = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }

    assert_equal expected, @decrypt.decrypt
  end

  def test_translate_phrase
    assert_equal "keder ohulw", @encrypt.translate_phrase("encrypt")
    assert_equal "hello world", @decrypt.translate_phrase("decrypt")
  end
end
