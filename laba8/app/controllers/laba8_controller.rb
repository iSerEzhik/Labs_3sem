# frozen_string_literal: true

# Контроллер для Laba8
class Laba8Controller < ApplicationController
  def input; end

  def view
    begin
      @received = Integer(params[:v1])
    rescue StandardError
      @result = 'Unknown!'
    end
    begin
      id = Laba8Model.find_by!(number: @received)
      @result = id.number
      @iterates = id.iterates
    rescue ActiveRecord::RecordNotFound
      @result, @iterates = calculate(@received)
      Laba8Model.create(number:@received,result:@result,iterates:@iterates)
    end
  end

  def all_results
    result = Laba8Model.all.map { |el| { number: el.number, result:el.result, iterates: el.iterates} }
    respond_to do |format|
      format.xml { render xml: result }
    end
  end
end

def calculate(arg)
  iterates = {}
  eps = 10 ** -4
  x = 1.0
  i = 1
  loop do
    xn = (x + arg / x) / 2.0
    break if (x - xn).abs < eps

    x = xn
    iterates["iterate#{i}"] = x
    i += 1
  end
  [x, iterates]
end
