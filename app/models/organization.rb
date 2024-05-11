# frozen_string_literal: true

class Organization < ApplicationRecord
  validates :name, presence: true

  has_many :users, dependent: :destroy
end
