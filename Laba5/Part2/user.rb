# frozen_string_literal: true

require './main'

puts "Hello, user!\nPlease,put strings, when you want to stop put 0:"
strings = ''
while (str = gets.chomp) != '0'
  strings += "#{str}\n"
end
puts strings
puts change_string(strings)
