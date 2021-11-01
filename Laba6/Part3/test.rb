# frozen_string_literal: true

require './main'
require 'minitest/autorun'

# Tests for main.rb
class TestEquationSolver < Minitest::Unit::TestCase
  def test_first_equation_block
    p root(10**-5) { |x| (x**2) + Math.sin(x / 2.0) }
  end

  def test_first_equation_lambda
    p root(10**-5, &->(x) { (x**2) + Math.sin(x / 2.0) })
  end

  def test_first_equation_proc
    p root(10**-5, &proc { |x| (x**2) + Math.sin(x / 2.0) })
  end

  def test_second_equation_block
    p root(10**-5) { |x| Math.atan(x) + x - 1 }
  end

  def test_second_equation_lambda
    p root(10**-5, &->(x) { Math.atan(x) + x - 1 })
  end

  def test_second_equation_proc
    p root(10**-5, &proc { |x| Math.atan(x) + x - 1 })
  end
end
