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

%w[Kyiv Kharkiv Odessa Lviv Dnipro].each do |city|
  Location.find_or_create_by(name: city)
end
