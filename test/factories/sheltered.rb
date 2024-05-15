# frozen_string_literal: true

FactoryBot.define do
  factory :sheltered do
    organization { create(:organization) }
    name { 'José Silva' }
    birthdate { '1954-01-01' }
  end
end
