# frozen_string_literal: true

def root(accuracy, &block)
  a, b = locale_root(&block)
  c = 0
  if !a || !b
    puts 'Нет положительных корней!!'
    return
  end
  while b - a > accuracy
    c = (a + b) / 2.0
    return c if block.call(c).zero?

    if (block.call(a) * block.call(c)).negative?
      b = c
    else
      a = c
    end
  end
  c.round(5)
end

def locale_root(&block)
  x = -1
  step = 1
  prev = 0
  enum = Enumerator.new do |my_enum|
    loop do
      prev = block.call(x)
      my_enum << x += step
    end
  end
  enum.take_while { block.call(x).negative? || (block.call(x).positive? && prev.negative?) || prev.zero? }.pop(2)
end
