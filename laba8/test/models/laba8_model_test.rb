require 'test_helper'

class Laba8ModelTest < ActiveSupport::TestCase
  test 'unique value' do
    first = Laba8Model.new number:2,result:1.0,iterates:[]
    first.save
    second = Laba8Model.new number:2,result:1.0,iterates:[]
    second.validate
    second.errors
    assert_equal ['has already been taken'],second.errors[:number]
  end

  test 'good numbers' do
    first = Laba8Model.new result:101.0,iterates:[]
    first.validate
    assert_equal ["can't be blank"],first.errors[:number]
  end
end
