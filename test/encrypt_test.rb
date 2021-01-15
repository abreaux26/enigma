require './test/test_helper'
require './lib/encrypt'

class EncryptTest < Minitest::Test
  def setup
    @encrypt = Encrypt.new("hello world", "02715", "040895")
  end

  def test_it_exists
    assert_instance_of Encrypt, @encrypt
  end

  def test_it_has_readable_attributes
    assert_equal "hello world", @encrypt.phrase
    assert_equal "02715", @encrypt.key
    assert_equal "040895", @encrypt.date
  end

  def test_a_shift
    assert_equal "02", @encrypt.a_shift
  end

  def test_b_shift
    assert_equal "27", @encrypt.b_shift
  end

  def test_c_shift
    assert_equal "71", @encrypt.c_shift
  end

  def test_d_shift
    assert_equal "15", @encrypt.d_shift
  end
end
