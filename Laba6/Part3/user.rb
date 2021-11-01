# frozen_string_literal: true

require './main'
FIRST_EQUATION = 'x^2 + sin(x/2) = 0'
SECOND_EQUATION = 'arctg(x) + x = 1'
BLOCKS = { 1 => proc { |x| (x**2) + Math.sin(x / 2.0) }, 2 => proc { |x| Math.atan(x.to_f) + x - 1 } }.freeze

def gets_choice
  message = ''
  n = 0
  loop do
    puts "Выберите уравнение #{message}:\n1.#{FIRST_EQUATION}\n2.#{SECOND_EQUATION}\n"
    message = '(Пожалуйста вводите числа в диапозоне от 1 до 2)'
    break if (1..2).include?((n = gets.chomp.to_i))
  end
  n
end

def gets_accuracy
  puts 'Введите точность: '
  gets.chomp.to_f
end

p "Решение уравнения :#{root(gets_accuracy, &blocks[gets_choice])}"
