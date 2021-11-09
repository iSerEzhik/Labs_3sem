# frozen_string_literal: true

MY_ACCURACY = {
  small: 10**-4.to_f,
  smaller: 10**-5.to_f
}.freeze

def calculate_row(accuracy)
  sum = 0
  k = 1
  while function(k) > accuracy
    sum += function(k)
    k = k.next
  end
  puts "Колличество иттераций: #{k}"
  sum
end

def function(arg)
  1.to_f / (arg * (arg + 1))
end
