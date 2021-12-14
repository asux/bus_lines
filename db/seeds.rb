# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
admin = User.find_or_initialize_by(email: 'admin@example.com')
unless admin.persisted?
  admin.update(first_name: 'Admin',
               last_name: 'BusLines',
               role: :admin,
               password: 'admin888buslines')
end

locations = %w[Kyiv Kharkiv Odessa Lviv Dnipro].map do |city|
  Location.find_or_create_by(name: city)
end

(0..8).map { |h| h * 3 }.each do |hour|
  departure_location = locations.sample
  arrival_location = (locations - [departure_location]).sample
  departure_at = Date.tomorrow.beginning_of_day + hour.hours
  line = Line.find_or_initialize_by(departure_location: departure_location,
                                    arrival_location: arrival_location,
                                    departure_at: departure_at)
  next unless line.new_record?

  line.update(
    duration: (2..8).to_a.sample * 60,
    price_cents: [300, 400, 500, 600].sample * 100,
    price_currency: 'UAH',
    capacity: [20, 30, 40].sample,
    tickets_count: 0
  )
end
