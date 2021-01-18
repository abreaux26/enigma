require './test/test_helper'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_encrypt
    expected = {
      encryption: 'keder ohulw',
      key: '02715',
      date: '040895'
    }
    assert_equal expected, @enigma.encrypt('hello world', '02715', '040895')
  end

  def test_decrypt
    expected = {
      decryption: 'hello world',
      key: '02715',
      date: '040895'
    }
    assert_equal expected, @enigma.decrypt('keder ohulw', '02715', '040895')
  end

  def test_default_key_encrypt
    assert_instance_of String, @enigma.encrypt('hello world')[:key]
    assert_equal 5, @enigma.encrypt('hello world')[:key].length
  end

  def test_default_date_encrypt
    assert_instance_of String, @enigma.encrypt('hello world')[:date]
    assert_equal 6, @enigma.encrypt('hello world')[:date].length
  end

  def test_default_date_decrypt
    assert_instance_of String, @enigma.decrypt('keder ohulw', '02715')[:date]
    assert_equal 6, @enigma.decrypt('keder ohulw', '02715')[:date].length
  end
end
