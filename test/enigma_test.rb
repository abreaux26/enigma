require './test/test_helper'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def test_encrypt
    enigma = Enigma.encrypt("hello world", "02715", "040895")

    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, enigma
  end

  def test_decrypt
    enigma = Enigma.decrypt("keder ohulw", "02715", "040895")

    expected = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, enigma
  end
end
