# frozen_string_literal: true

class Role < ApplicationRecord
  belongs_to :organization

  validates :name, presence: true
end
