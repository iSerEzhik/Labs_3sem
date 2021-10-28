MY_ACCURACY = {
  small: 10 ** -4.to_f,
  smaller: 10 ** -5.to_f
}

def calculate_row(accuracy)
  current = 0
  k = 1
  e = Enumerator.new do |y|
    loop do
      current = function(k)
      k += 1
      y << current
    end
  end
  sum = e.take_while { current - function(++k) > accuracy }.sum
  puts("Колличество иттераций: #{k}")
  sum
end

def function(k)
  1.to_f / (k * (k + 1))
end

