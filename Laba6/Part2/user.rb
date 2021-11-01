# frozen_string_literal: true

require './main'

puts 'Введите с какой точностью нужно вычислить выражение: '
accuracy = gets.chomp.to_f
puts "Результат с точностью #{accuracy}: #{calculate_row(accuracy).round(2)}"
