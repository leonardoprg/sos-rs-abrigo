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

  test 'validates phone_number' do
    user = User.new(phone_number: '5199118877')
    user.valid?

    assert_equal user.errors[:phone_number], ['já está em uso']
  end
end
