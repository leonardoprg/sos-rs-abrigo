# frozen_string_literal: true

class User < ApplicationRecord
  ALLOWED_WORK_SHIFTS = %i[morning afternoon night].freeze
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_validation :clean_work_shifts
  validates :name, presence: true
  validates :username, presence: true, uniqueness: true,
                       format: { with: /\A[a-zA-Z0-9]+\z/, message: :only_letters_and_numbers_allowed }
  validate :work_shifts_must_be_valid

  enum status: { admin: 0 }

  belongs_to :organization
  has_many :role_users, dependent: :destroy
  has_many :roles, through: :role_users

  def permissions
    roles.map(&:permissions).flatten.uniq.compact_blank
  end

  def volunteer_display_data
    ws = work_shifts&.map { |v| I18n.t(v, scope: %i[activerecord attributes work_shifts]) }&.join(', ')
    "#{name} - #{roles.map(&:name).join(', ')} - #{ws}"
  end

  private

  def work_shifts_must_be_valid
    return if work_shifts.blank?
    return unless (work_shifts.map(&:to_sym) - ALLOWED_WORK_SHIFTS).any?

    errors.add(:work_shifts, :must_be_valid)
  end

  def clean_work_shifts
    return if work_shifts.blank?

    self.work_shifts = work_shifts.compact_blank
  end

  # https://github.com/heartcombo/devise/wiki/How-To:-Allow-users-to-sign-in-with-something-other-than-their-email-address
  def email_required?
    false
  end

  # https://github.com/heartcombo/devise/wiki/How-To:-Allow-users-to-sign-in-with-something-other-than-their-email-address
  def email_changed?
    false
  end
end
