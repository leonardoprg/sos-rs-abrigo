# frozen_string_literal: true

require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  test 'validates name' do
    role = Role.new(name: nil)
    role.valid?
    assert_equal role.errors[:name], ['não pode ficar em branco']
  end

  test 'validates permissions' do
    role = Role.new(permissions: ['invalid'])
    role.valid?

    assert_equal role.errors[:permissions], ['precisa ser válido']
  end
end
