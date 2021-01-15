require './test/test_helper'
require './lib/random'

class RandomTest < Minitest::Test
  def setup
    @random = Random.new
  end

  def test_it_exists
    assert_instance_of Random, @random
  end

  def test_it_has_readable_attributes
    assert_equal 5, @random.number.split('').count
    assert_instance_of String, @random.number
  end
end
