# frozen_string_literal: true

class Line < ApplicationRecord
  belongs_to :departure_location, class_name: 'Location'
  belongs_to :arrival_location, class_name: 'Location'

  validates :departure_location, presence: true
  validates :arrival_location, presence: true
  validates :departure_at, presence: true, uniqueness: { scope: %i[departure_location_id arrival_location_id] }
  validates :duration, presence: true, numericality: { only_integer: true }
  validates :capacity, presence: true, numericality: { only_integer: true }

  monetize :price_cents
end
