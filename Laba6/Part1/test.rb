require 'minitest/autorun'
require './main.rb'

class TestCalculate < Minitest::Unit::TestCase
  def test_small
    assert_equal(1,calculate_row(MY_ENUM[:small]).round(1))
  end

  def test_smaller
    assert_equal(1,calculate_row(MY_ENUM[:smaller]).round(1))
  end
end
