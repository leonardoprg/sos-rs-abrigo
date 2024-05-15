# frozen_string_literal: true

FactoryBot.define do
  factory :sheltered_medication do
    sheltered { create(:sheltered, name: 'Ronaldinho Gaúcho') }
    medicin { create(:medicin, name: 'Amoxicilina') }
    quantity { 600 }
    unit { 'mg' }
  end
end
