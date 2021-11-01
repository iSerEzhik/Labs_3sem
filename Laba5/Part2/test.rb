# frozen_string_literal: true

require 'minitest/autorun'
require './main'

# Test changing string
class TestStringChange < Minitest::Unit::TestCase
  def test_changing_string
    strings = generate_random_string
    assert_equal(strings[0].join(' '), change_string(strings[1]))
  end
end

def generate_random_string
  true_string = []
  [true_string, (0..(rand(3..7))).flat_map do
    word = (0..(rand(5..14))).map { rand(65..90).chr }.join
    true_string.append(word) unless (word.downcase.chars & VOWELS).empty?
    word
  end.join(' ')]
end
