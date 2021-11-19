# frozen_string_literal: true

require 'minitest/autorun'
require './main'

FILE_F_PATH = './F.txt'
FILE_G_PATH = './G.txt'
FILE_LENGTH = 20

MIN_CHR = 65
MAX_CHR = 90

def generate_random_char
  (MIN_CHR + rand(MAX_CHR - MIN_CHR)).chr
end

#@todo файлы с tmp названиями
# @return num of different char in files
def generate_files(path_to_first_file, path_to_second_file, length)
  first_file = File.new(path_to_first_file, 'w')
  second_file = File.new(path_to_second_file, 'w')
  first_file_str = ''
  second_file_str = ''
  different_chr = rand(1..length)
  (1..length).each_with_index do |_element, i|
    if i == different_chr
      first_file_str += generate_random_char
      second_file_str += generate_random_char
    else
      chr = generate_random_char
      first_file_str += chr
      second_file_str += chr
    end
  end
  first_file.write(first_file_str)
  second_file.write(second_file_str)
  first_file.close
  second_file.close
  different_chr + 1
end

# Test working with files
class TestWorkWithFiles < Minitest::Unit::TestCase
  def test_working_with_files
    assert_equal(generate_files(FILE_F_PATH, FILE_G_PATH, FILE_LENGTH), compare_files(FILE_F_PATH, FILE_G_PATH))
  end
end
