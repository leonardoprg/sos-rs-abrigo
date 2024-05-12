# frozen_string_literal: true

class RoleUser < ApplicationRecord
  belongs_to :role
  belongs_to :user
end
