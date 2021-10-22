MY_ENUM = {
  small: 10 ** -4.to_f,
  smaller: 10 ** -5.to_f
}

def calculate_row(accuracy)
  buf = 1
  sum = 0
  k = 1
  while buf - function(k) > accuracy
      sum += function(k)
      buf = function(k)
      k = k.next
  end
  puts "Колличество иттераций: #{k}"
  sum
end

def function(k)
  1.to_f / (k * (k + 1))
end
