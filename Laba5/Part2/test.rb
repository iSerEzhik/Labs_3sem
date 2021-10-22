require 'minitest/autorun'
require './main.rb'

class TestStringChange < Minitest::Unit::TestCase

  def test_1
    change_string(generate_random_string)
  end
end

def generate_random_string
  (0..3 + rand(5)).map { (0..5 + rand(10)).map { (65 + rand(26)).chr }.join }.join(' ');
end
