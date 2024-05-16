# frozen_string_literal: true

class Organization < ApplicationRecord
  validates :name, presence: true

  has_many :users, dependent: :destroy
  has_many :roles, dependent: :destroy
  has_many :sheltereds, dependent: :destroy
  has_many :work_schedules, dependent: :destroy
  has_many :sheltered_medications, dependent: :destroy
  has_many :sheltered_medication_logs, dependent: :destroy
end
