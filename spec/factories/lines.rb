# frozen_string_literal: true

FactoryBot.define do
  factory :line do
    departure_location factory: :location
    arrival_location factory: :location
    capacity { (1..4).map { |i| i * 10 }.sample }
    departure_at { '2021-12-14 6:00:00' }
    duration { (1..8).map { |i| i * 600 }.sample }
    price_cents { (1..8).map { |i| i * 100 }.sample }
    price_currency { 'UAH' }
  end
end
