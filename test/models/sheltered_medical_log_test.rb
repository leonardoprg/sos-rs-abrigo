# frozen_string_literal: true

require 'test_helper'

class ShelteredMedicalLogTest < ActiveSupport::TestCase
  test 'validates presence of description' do
    sheltered_medical_log = ShelteredMedicalLog.new(description: nil)
    assert_not sheltered_medical_log.valid?

    assert_equal ['não pode ficar em branco'], sheltered_medical_log.errors.messages[:description]
  end
end
