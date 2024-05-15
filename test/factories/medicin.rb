# frozen_string_literal: true

FactoryBot.define do
  factory :medicin do
    name { 'Paracetamol' }
    leaflet { 'https://ben-u-ron.pt/wp-content/uploads/2023/08/ben-u-ron-500mg-capsulas_FI.pdf' }
  end
end
