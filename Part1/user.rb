# frozen_string_literal: true

require './main'
[STDIN,STDOUT].each { |io| io.set_encoding(Encoding.find(Encoding.locale_charmap),__ENCODING__) }
name = gets.chomp
puts "Привет, #{name}"
