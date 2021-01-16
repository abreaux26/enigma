require './test/test_helper'
require './lib/decrypt_message'

class DecryptMessageTest < Minitest::Test
  def setup
    @decrypt = DecryptMessage.new("keder ohulw", "02715", "040895")
  end

  def test_it_exists
    assert_instance_of DecryptMessage, @decrypt
  end

  def test_it_has_readable_attributes
    assert_equal "keder ohulw", @decrypt.phrase
    assert_equal "02715", @decrypt.key
    assert_equal "040895", @decrypt.date
  end

  def test_offset
    assert_equal "1025", @decrypt.offset
  end

  def test_a_shift
    assert_equal 3, @decrypt.a_shift
  end

  def test_b_shift
    assert_equal 27, @decrypt.b_shift
  end

  def test_c_shift
    assert_equal 73, @decrypt.c_shift
  end

  def test_d_shift
    assert_equal 20, @decrypt.d_shift
  end

  def test_decrypt
    expected = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }

    assert_equal expected, @decrypt.decrypt
  end

  def test_phrase_breakdown
    assert_equal "hello world", @decrypt.phrase_decryption
  end
end
