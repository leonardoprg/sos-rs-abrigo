# frozen_string_literal: true

class Sheltered < ApplicationRecord
  belongs_to :organization

  validates :name, presence: true

  enum house_status: { total_loss: 0, partial_loss: 1, no_damage: 2 }
  enum gender: { male: 0, female: 1, uninformed: 2 }
end
