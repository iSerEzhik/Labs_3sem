# frozen_string_literal: true

require 'test_helper'

#RSpec
class Laba8ControllerTest < ActionController::TestCase
  test 'should get input' do
    get :input
    assert_response :success
  end

  test 'should get view' do
    get :view
    assert_response :success
  end

  test 'should get HTML content type' do
    get :view, params: {side:'server'}
    assert_equal('text/html',@response.content_type.split(';')[0],'Received another format')
  end
  test 'should get XML content type from xml+xslt' do
    get :view, params: {side:'client-with-xslt'}
    assert_equal('application/xml',@response.content_type.split(';')[0],'Received another format')
  end
  test 'should get xml content type' do
    get :view, params: {side:'xml'}
    assert_equal('application/xml',@response.content_type.split(';')[0],'Received another format')
  end
end
