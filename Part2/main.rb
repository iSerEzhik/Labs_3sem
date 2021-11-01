# frozen_string_literal: true

# Класс Прямоугольника
class Rectangle
  def initialize(length, width)
    @length = length
    @width = width
  end

  attr_reader :length, :width

  def type
    @length == @width ? 'Квадрат' : 'Прямоугольник'
  end
end

# Класс параллелипипеда
class Parallelepiped < Rectangle
  def initialize(length, width, height)
    super(length, width)
    @height = height
  end
  attr_reader :height

  def type
    if @length == @width && @length == @height
      'Куб'
    else
      @length == @width || @length == @height || @width == @height ? 'Прямоугольный' : 'Прямой'
    end
  end
end
