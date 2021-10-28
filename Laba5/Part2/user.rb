require './main.rb'

puts "Hello, user!\nPlease,put strings, when you want to stop put 0:"
strings = '';
while (str = gets.chomp) != '0' do
  strings += "#{str}\n"
end
puts strings
puts change_string(strings)