# frozen_string_literal: true

require 'minitest/autorun'
require './main'

# Тестовый класс для main.rb
class TestClasses < Minitest::Unit::TestCase
  def test_square
    assert_equal('Квадрат', Rectangle.new(50, 50).type)
  end

  def test_rectangle
    assert_equal('Прямоугольник', Rectangle.new(50, 10).type)
  end

  def test_cube
    assert_equal('Куб', Parallelepiped.new(50, 50, 50).type)
  end

  def test_rectangle_parallelepiped
    assert_equal('Прямоугольный', Parallelepiped.new(50, 10, 50).type)
  end

  def test_straight_parallelepiped
    assert_equal('Прямой', Parallelepiped.new(50, 20, 10).type)
  end
end
