# frozen_string_literal: true

require './main'

puts "Результат с погрешностью 10^-4:\t#{calculate_row(MY_ACCURACY[:small])}"
puts "Результат с погрешностью 10^-5:\t#{calculate_row(MY_ACCURACY[:smaller])}"
