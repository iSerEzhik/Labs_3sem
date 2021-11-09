# frozen_string_literal: true

MY_ACCURACY = {
  small: 10**-4.to_f,
  smaller: 10**-5.to_f
}.freeze

def calculate_row(accuracy)
  k = 1
  e = Enumerator.new do |y|
    loop do
      current = function(k)
      k += 1
      y << current
    end
  end
  sum = e.take_while {function(++k) > accuracy }.sum
  puts("Колличество иттераций: #{k}")
  sum
end

def function(arg)
  1.to_f / (arg * (arg + 1))
end
