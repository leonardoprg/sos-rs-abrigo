# frozen_string_literal: true

class ShelteredMedicalLog < ApplicationRecord
  belongs_to :organization
  belongs_to :sheltered

  validates :description, presence: true
end
