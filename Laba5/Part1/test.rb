# frozen_string_literal: true

require 'minitest/autorun'
require './main'

# Test Calculating
class TestCalculate < Minitest::Unit::TestCase
  def test_positive
    a = 1
    b = 1
    assert_equal(-0.103, calculate_function(a, b))
  end

  def test_negative
    a = -1
    b = -1
    assert_equal(0.103, calculate_function(a, b))
  end

  def test_zeros
    a = 0
    b = 0
    assert_equal(0, calculate_function(a, b))
  end
end
