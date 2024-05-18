# frozen_string_literal: true

class Sheltered < ApplicationRecord
  belongs_to :organization
  belongs_to :sheltered, optional: true
  has_many :sheltereds, dependent: :nullify
  has_many :sheltered_medications, dependent: :destroy
  has_many :sheltered_medical_logs, dependent: :destroy

  validates :name, presence: true

  scope :active, -> { where(departure_date: nil) }

  enum house_status: { total_loss: 'total_loss', partial_loss: 'partial_loss', flooded: 'flooded', other: 'other' }
  enum gender: { male: 'male', female: 'female', uninformed: 'uninformed' }
  enum city: { cachoeirinha: 'cachoeirinha', porto_alegre: 'porto alegre', canoas: 'canoas', gravatai: 'gravatai' }

  def children?
    birthdate && birthdate >= 12.years.ago
  end

  def teenager?
    birthdate && birthdate <= 12.years.ago && birthdate >= 18.years.ago
  end

  def adult?
    birthdate && birthdate <= 18.years.ago && birthdate >= 65.years.ago
  end

  def elderly?
    birthdate && birthdate <= 65.years.ago
  end
end
