# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'validates name' do
    user = User.new(name: nil)
    user.valid?

    assert_equal user.errors[:name], ["can't be blank"]
  end

  test 'validates work_shifts' do
    user = User.new(work_shifts: ['invalid'])
    user.valid?

    assert_equal user.errors[:work_shifts], ['must be valid']
  end
end
