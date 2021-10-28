require 'minitest/autorun'
require './main.rb'

class TestStringChange < Minitest::Unit::TestCase

  def test_1
    strings = generate_random_string
    assert_equal(strings[0].join(' '),change_string(strings[1]))
  end
end

def generate_random_string
  true_string = []
  [true_string,(0..3 + rand(5)).flat_map do
    word = (0..5 + rand(10)).map { (65 + rand(26)).chr}.join
    unless (word.downcase.chars & VOWELS).empty? then
      true_string = true_string.append(word)
    end
    word
  end.join(' ')]
end
