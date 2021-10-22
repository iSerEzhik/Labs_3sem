MY_ENUM = {
  small: 10 ** -4.to_f,
  smaller: 10 ** -5.to_f
}

def calculate_row(accuracy)
  [1,0].cycle(2){p :&}
end

def function(k)
  1.to_f / (k * (k + 1))
end

