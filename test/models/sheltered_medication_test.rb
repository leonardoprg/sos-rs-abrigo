# frozen_string_literal: true

require 'test_helper'

class ShelteredMedicationTest < ActiveSupport::TestCase
  test 'should be valid' do
    sheltered_medication = FactoryBot.create(:sheltered_medication)
    assert sheltered_medication.valid?
  end

  test 'quantity should be present' do
    sheltered_medication = FactoryBot.create(:sheltered_medication)
    sheltered_medication.quantity = nil
    assert_not sheltered_medication.valid?
    assert_includes sheltered_medication.errors[:quantity], 'não pode ficar em branco'
  end

  test 'unit should be present' do
    sheltered_medication = FactoryBot.create(:sheltered_medication)
    sheltered_medication.unit = nil
    assert_not sheltered_medication.valid?
    assert_includes sheltered_medication.errors[:unit], 'não pode ficar em branco'
  end

  test 'should belong to a medicin' do
    sheltered_medication = FactoryBot.create(:sheltered_medication)
    assert_instance_of Medicin, sheltered_medication.medicin
  end

  test 'should belong to a sheltered' do
    sheltered_medication = FactoryBot.create(:sheltered_medication)
    assert_instance_of Sheltered, sheltered_medication.sheltered
  end

  test 'quantity should be a positive number' do
    sheltered_medication = FactoryBot.create(:sheltered_medication)
    sheltered_medication.quantity = -1
    assert_not sheltered_medication.valid?
    assert_includes sheltered_medication.errors[:quantity], 'deve ser maior que 0'
  end
end
