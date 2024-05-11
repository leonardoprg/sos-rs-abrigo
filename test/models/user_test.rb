# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'validates name' do
    user = User.new(name: nil)
    user.valid?

    assert_equal user.errors[:name], ['não pode ficar em branco']
  end

  test 'validates work_shifts' do
    user = User.new(work_shifts: ['invalid'])
    user.valid?

    assert_equal user.errors[:work_shifts], ['precisa ser válido']
  end
end
