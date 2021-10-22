VOWELS = %w@а о е ё ю я у э ы и a e y u o i@

def change_string(string)
  puts "Start string:\t#{string}"
  new_string, string = string.split(' ').partition { |word| (word.downcase.chars & VOWELS).empty? }
  puts "Number of deleted words:\t#{new_string.length}"
  puts "Changed string:\t#{string.join(' ')}"
end
