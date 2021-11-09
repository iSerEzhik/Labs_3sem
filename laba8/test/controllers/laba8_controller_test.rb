# frozen_string_literal: true

require 'test_helper'

class Laba8ControllerTest < ActionController::TestCase
  test 'should get input' do
    get :input
    assert_response :success
  end

  test 'should get view' do
    get :view
    assert_response :success
  end

  test 'should get from view with 100' do
    get :view, params: { v1: 100 }
    assert_equal assigns[:result].round, 10
  end
  test 'should get from view with empty' do
    get :view, params: { v1: '' }
    assert_equal assigns[:result], 'Unknown!'
  end
end
