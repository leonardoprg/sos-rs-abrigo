# frozen_string_literal: true

require 'test_helper'

class ShelteredTest < ActiveSupport::TestCase
  test 'validates name' do
    sheltered = Sheltered.new
    assert_not sheltered.valid?

    assert_equal sheltered.errors[:name], ["can't be blank"]
  end
end