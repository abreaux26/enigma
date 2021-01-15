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
end
