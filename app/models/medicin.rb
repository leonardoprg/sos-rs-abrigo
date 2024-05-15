# frozen_string_literal: true

class Medicin < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
