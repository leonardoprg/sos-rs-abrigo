# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'validates name' do
    user = User.new(name: nil)
    user.valid?

    assert_equal user.errors[:name], ["can't be blank"]
  end
end
