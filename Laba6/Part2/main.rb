# frozen_string_literal: true

MY_ACCURACY = {
  small: 10**-4.to_f,
  smaller: 10**-5.to_f
}.freeze

def calculate_row(accuracy)
  e = Enumerator.new do |y|
  k = 1
    loop do
      y << function(k)
      k += 1
    end
  end
  arr = e.take_while {|x| x > accuracy }
  puts("Колличество иттераций: #{arr.length}")
  arr.sum
end

def function(arg)
  1.to_f / (arg * (arg + 1))
end
