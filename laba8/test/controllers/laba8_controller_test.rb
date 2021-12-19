# frozen_string_literal: true

require 'test_helper'

# RSpec
class Laba8ControllerTest < ActionController::TestCase
  def setup
    Laba8Model.all.each(&:delete)
  end

  test 'add Model to db' do
    count_before = Laba8Model.count
    get :view, params: { v1: '100' }
    count_after = Laba8Model.count
    assert_equal count_before + 1, count_after
  end

  test 'unique values' do
    get :view, params: { v1: '100' }
    count_before = Laba8Model.count
    get :view, params: { v1: '100' }
    count_after = Laba8Model.count
    assert_equal count_before, count_after
  end
end
