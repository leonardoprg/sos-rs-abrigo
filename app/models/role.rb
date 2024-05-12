# frozen_string_literal: true

class Role < ApplicationRecord
  PERMISSIONS = %i[
    all
    volunteers
    sheltereds
    work_schedules
  ].freeze

  belongs_to :organization

  validates :name, presence: true
  validate :permissions_must_be_valid

  private

  def permissions_must_be_valid
    return if permissions.blank?
    return unless (permissions.map(&:to_sym) - PERMISSIONS).any?

    errors.add(:permissions, :must_be_valid)
  end
end
