# frozen_string_literal: true
#
class ApplicationController < ActionController::API
  include ActionController::MimeResponds
end


class Laba10Controller < ApplicationController
  def xml_to_html
    begin
      if (v1 = params[:v1]).empty?
        throw StandardError
      else
        @result, @iterates = calculate(v1)
      end
        rescue StandardError
        @result = 'Unknown!'

      end
    respond_to do |format|
      format.rss { render xml: { result: @result, iterates: @iterates } }
      format.xml { render xml: { result: @result, iterates: @iterates } }
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

