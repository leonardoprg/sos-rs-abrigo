# frozen_string_literal: true

require 'test_helper'

class ShelteredMedicationLogTest < ActiveSupport::TestCase
  test 'should be valid' do
    sheltered_medication_log = sheltered_medication_logs(:paul_paracetamol_one)
    assert sheltered_medication_log.valid?
  end

  test 'should require single intake data' do
    sheltered_medication_log = sheltered_medication_logs(:paul_paracetamol_one)
    sheltered_medication_log.sheltered_medication = nil
    assert_not sheltered_medication_log.valid?
    assert_includes(
      sheltered_medication_log.errors[:base],
      'Medication Log has to have either a medication ref or single intake data',
    )
  end
end
