# frozen_string_literal: true

require 'minitest/autorun'
require './main'

# Тестовый класс
class TestCalculate < Minitest::Unit::TestCase
  def test_small
    assert_equal(1, calculate_row(MY_ACCURACY[:small]).round(1))
  end

  def test_smaller
    assert_equal(1, calculate_row(MY_ACCURACY[:smaller]).round(1))
  end
end
