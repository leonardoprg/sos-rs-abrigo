# frozen_string_literal: true

FactoryBot.define do
  factory :sheltered_medication_log do
    sheltered_medication { create(:sheltered_medication) }
  end
end
