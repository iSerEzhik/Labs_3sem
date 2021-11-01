# frozen_string_literal: true

def calculate_function(arg1, arg2)
  ((Math.sin(arg1.to_f) - arg2.to_f) / (arg2.to_f.abs + Math.cos(arg2.to_f**2))).round(3)
end
