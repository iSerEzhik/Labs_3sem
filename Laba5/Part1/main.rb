
def calculate_function(a,b)
    ((Math.sin(a.to_f)-b.to_f)/(b.to_f.abs + Math.cos(b.to_f**2))).round(3);
end
