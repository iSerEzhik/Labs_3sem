# frozen_string_literal: true

def compare_files(path_to_file_f, path_to_file_g)
  File.new(path_to_file_f, 'r').gets.chomp.chars.zip(File.new(path_to_file_g, 'r').gets.chomp.chars)
      .each_with_index.map do |x, i|
    i + 1 if x[0] != x[1]
  end.compact.shift
end
