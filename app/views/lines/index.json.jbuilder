# frozen_string_literal: true

json.array! @lines, :id, :departure_location, :arrival_location, :departure_at, :duration, :capacity,
            :tickets_count, :price
