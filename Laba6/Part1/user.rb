require './main.rb'

puts "Результат с погрешностью 10^-4:\t#{calculate_row(MY_ENUM[:small])}"
puts "Результат с погрешностью 10^-4:\t#{calculate_row(MY_ENUM[:smaller])}"
