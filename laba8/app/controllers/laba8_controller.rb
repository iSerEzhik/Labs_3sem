# frozen_string_literal: true

# Контроллер для Laba8
class Laba8Controller < ApplicationController
  def input; end

  def view
    @received = params[:v1]
    if !@received || @received.empty?
      @result = 'Unknown!'
    else
      @result, @iterates = calculate(params[:v1].to_i)
    end
    p @result
    respond_to do |format|
      format.html
      format.json do
        render json:
                 { type: @result.class.to_s, value: @result }
      end
    end
  end
end

def calculate(arg)
  iterates = {}
  eps = 10**-4
  x = 1.0
  i = 1
  loop do
    xn = (x + arg / x) / 2.0
    break if (x - xn).abs < eps

    x = xn
    iterates[i] = x
    i += 1
  end
  [x, iterates]
end
