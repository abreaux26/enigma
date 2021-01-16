require './test/test_helper'
require './lib/encrypt'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_encrypt
    assert_instance_of Encrypt, @enigma.encrypt("hello world", "02715", "040895")
  end
end
