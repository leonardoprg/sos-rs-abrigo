# frozen_string_literal: true

require 'test_helper'

class ShelteredTest < ActiveSupport::TestCase
  test 'validates name' do
    sheltered = Sheltered.new
    assert_not sheltered.valid?

    assert_equal sheltered.errors[:name], ['não pode ficar em branco']
  end

  test 'children?' do
    sheltered = Sheltered.new(birthdate: 11.years.ago)
    assert sheltered.children?

    sheltered.birthdate = 12.years.ago
    assert_not sheltered.children?
  end

  test 'teenager?' do
    sheltered = Sheltered.new(birthdate: 13.years.ago)
    assert sheltered.teenager?

    sheltered.birthdate = 18.years.ago
    assert_not sheltered.teenager?
  end

  test 'adult?' do
    sheltered = Sheltered.new(birthdate: 19.years.ago)
    assert sheltered.adult?

    sheltered.birthdate = 65.years.ago
    assert_not sheltered.adult?
  end

  test 'elderly?' do
    sheltered = Sheltered.new(birthdate: 66.years.ago)
    assert sheltered.elderly?
  end
end
