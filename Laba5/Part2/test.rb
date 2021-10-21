require 'minitest/autorun'
require './main.rb'

class TestStringChange < Minitest::Unit::TestCase
  #@todo Сделать генерация строк рандомно ☺
  def test_1
    assert_equal "Шла Саша по шоссе",change_string("Шла тр Саша по шоссе")
  end

  def test_2
    assert_equal "Шла Саша по шоссе",change_string("Шла  Саша по шоссе")
  end

  def test_3
    assert_equal "Шла Саша по шоссе",change_string("рз ШлА САшА по шОссЕ")
  end
end
