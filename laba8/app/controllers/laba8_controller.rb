class Laba8Controller < ApplicationController
  def input
  end
  def view
    @received = params[:v1]
    if !@received || @received.empty?
    @result="Unknown!"
    else
    @result,@iterates = calculate(params[:v1].to_i)
    end
  end
end
def calculate(a)
  iterates = Hash.new
  eps = 10**-4
  x = 1.0
  i = 1
  loop do
    xn = (x+a/x)/2.0
    break if ((x-xn).abs<eps)
    x = xn
    iterates[i] = x
    i+=1
  end
  [x,iterates]
end