# frozen_string_literal: true

require './main'
FILE_F_PATH = './F.txt'
FILE_G_PATH = './G.txt'

file_f = File.new(FILE_F_PATH, 'w')
file_g = File.new(FILE_G_PATH, 'w')
puts 'Введите строчку файла F:'
file_f.write(gets.chomp)
puts 'Введите строчку файла G:'
file_g.write(gets.chomp)
file_f.close
file_g.close
puts "Первый различный символ под номером #{compare_files(FILE_F_PATH, FILE_G_PATH)}"
