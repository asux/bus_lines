# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    password { 'qwerty1234' }
    role { :passenger }

    trait :conductor do
      role { :conductor }
    end

    trait :admin do
      role { :admin }
    end
  end
end
