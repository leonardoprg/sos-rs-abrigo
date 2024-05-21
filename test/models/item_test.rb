# frozen_string_literal: true

require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  test 'validates name presence' do
    item = Item.new(name: nil)
    assert_not item.valid?

    assert_equal ['não pode ficar em branco'], item.errors[:name]
  end

  test 'validates quantity presence' do
    item = Item.new(quantity: nil)
    assert_not item.valid?

    assert_equal ['não pode ficar em branco'], item.errors[:quantity]
  end
end
