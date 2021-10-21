require 'minitest/autorun'
require './main.rb'

class TestCalculate < Minitest::Unit::TestCase

  def test_1
    a = 1
    b = 1
    assert_equal(-0.103, calculate_function(a, b))
  end

  def test_2
    a=-1
    b=-1
    assert_equal(0.103,calculate_function(a,b))
  end

  def test_3
    a=0
    b=0
    assert_equal(0,calculate_function(a,b))
  end
end 
