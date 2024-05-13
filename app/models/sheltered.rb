# frozen_string_literal: true

class Sheltered < ApplicationRecord
  belongs_to :organization

  validates :name, :birthdate, presence: true

  enum house_status: { total_loss: 'total_loss', partial_loss: 'partial_loss', flooded: 'flooded', other: 'other' }
  enum gender: { male: 'male', female: 'female', uninformed: 'uninformed' }
end
