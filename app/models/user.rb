# frozen_string_literal: true

class User < ApplicationRecord
  ALLOWED_WORK_SHIFTS = %i[morning afternoon night].freeze
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validate :work_shifts_must_be_valid

  enum status: { admin: 0 }

  belongs_to :organization

  private

  def work_shifts_must_be_valid
    return if work_shifts.blank?
    return unless (work_shifts - ALLOWED_WORK_SHIFTS).any?

    errors.add(:work_shifts, :must_be_valid)
  end
end
