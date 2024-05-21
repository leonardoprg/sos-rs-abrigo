# frozen_string_literal: true

class Role < ApplicationRecord
  PERMISSIONS = %i[
    all
    volunteers_list
    volunteers_create
    volunteers_update
    volunteers_destroy
    sheltereds_list
    sheltereds_create
    sheltereds_update
    sheltereds_destroy
    sheltereds_show
    work_schedules_list
    work_schedules_create
    work_schedules_update
    work_schedules_destroy
    items_list
    items_create
    items_update
    items_destroy
    items_show
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
