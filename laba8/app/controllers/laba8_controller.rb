# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'

# Контроллер для Laba8
class Laba8Controller < ApplicationController
  def input; end

  def view
    api_response = URI.open("http://localhost:3001/?v1=#{params[:v1]}&format=xml")
    case params[:type]
    when 'server'
      Nokogiri::XSLT(File.read('LR10_transformer.xslt')).transform(Nokogiri::XML(api_response))
    when 'client-with-xml'
      api_response.string.sub('?>', '?><?xml-stylesheet type="text/xsl" href="/browser_transform.xslt"?>')
    else
      render xml: api_response
    end
  end
end
