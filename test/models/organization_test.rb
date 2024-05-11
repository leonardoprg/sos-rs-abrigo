# frozen_string_literal: true

require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  test 'validates name' do
    organization = Organization.new(name: nil)
    organization.valid?

    assert_equal organization.errors[:name], ['não pode ficar em branco']
  end
end
