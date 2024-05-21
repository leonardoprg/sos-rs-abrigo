# frozen_string_literal: true

class Item < ApplicationRecord
  belongs_to :organization

  validates :name, :quantity, presence: true
end
