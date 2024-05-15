# frozen_string_literal: true

class ShelteredMedicationLog < ApplicationRecord
  belongs_to :sheltered_medication, optional: true
  belongs_to :medicin, optional: true
  belongs_to :sheltered, optional: true

  validate :medication_or_single_intake

  def medication_or_single_intake
    return true if sheltered_medication_id.present?

    unless medicin.present? && sheltered.present? && quantity.present? && unit.present?
      errors.add(:base, 'Medication Log has to have either a medication ref or single intake data')
    end

    true
  end
end
