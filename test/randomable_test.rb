require './test/test_helper'
require './lib/randomable'

class MockEncrypt
  include Randomable
end

class RandomTest < Minitest::Test
  def setup
    @encrypt = MockEncrypt.new
  end

  def test_it_exists
    assert_instance_of MockEncrypt, @encrypt
  end

  def test_it_has_readable_attributes
    assert_instance_of String, @encrypt.random_number
    assert_equal 5, @encrypt.random_number.split('').count
  end
end
