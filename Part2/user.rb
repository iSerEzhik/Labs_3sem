# frozen_string_literal: true

require './main'

def gets_choice
  message = ''
  n = 0
  loop do
    puts "Выберите класс для работы #{message}:\n1.Rectangle\n2.Parallelepiped\n"
    message = '(Пожалуйста вводите числа в диапозоне от 1 до 2)'
    break if (1..2).include?((n = gets.chomp.to_i))
  end
  n
end

case gets_choice
when 1
  puts 'Введите длину и ширину прямоугольника:'
  my_object = Rectangle.new(gets.chomp.to_i, gets.chomp.to_i)
  puts "Тип прямоугольника: #{my_object.type}\nДлина: #{my_object.length}\nШирина: #{my_object.width}"
when 2
  puts 'Введите длину, ширину и высоту параллелепипеда:'
  my_object = Parallelepiped.new(gets.chomp.to_i, gets.chomp.to_i, gets.chomp.to_i)
  puts "Тип параллелепипеда: #{my_object.type}\nДлина: #{my_object.length}\nШирина: #{my_object.width}\nВысота: #{my_object.height}"
end
