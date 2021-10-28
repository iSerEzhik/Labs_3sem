VOWELS = %w@а о е ё ю я у э ы и a e y u o i@

def change_string(string)
  count = 0
  puts "Start string:\t#{string}"
  string = string.split("\n").map do
  |row|
    row.split(' ').reject do
    |word|
      count+=1;
      (word.downcase.chars & VOWELS).empty?
    end
  end
  puts "Number of deleted words:\t#{count}"
  string.map{|elem| elem.join(' ')}
end