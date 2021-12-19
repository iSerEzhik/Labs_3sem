# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'

# Контроллер для Laba8
class Laba8Controller < ApplicationController
  def input; end

  def view
    api_response = URI.open("http://localhost:3001/?v1=#{params[:v1]}&format=xml")
    case params[:side]
    when 'server' # content-type=>text/html
      @result = render_with_file(api_response)
    when 'client-with-xslt' # content-type=>text/xml
      p api_response.to_s
      render xml: api_response.string.sub('?>', "?>\n<?xml-stylesheet type='text/xsl' href='/LR10_transformer.xslt'?>")
    else # content-type=>text/xml
      render xml: api_response
    end
  end
end
XSLT_FILE_PATH = 'public/LR10_transformer.xslt'
def render_with_file(xml)
  xslt = Nokogiri::XSLT(File.read(XSLT_FILE_PATH))
  xslt.transform(Nokogiri::XML(xml))
end
