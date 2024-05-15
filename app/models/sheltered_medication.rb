# frozen_string_literal: true

class ShelteredMedication < ApplicationRecord
  belongs_to :medicin
  belongs_to :sheltered

  has_many :sheltered_medication_logs, dependent: :destroy

  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :unit, presence: true
end
