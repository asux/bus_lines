# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Line, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:departure_location).class_name('Location') }
    it { is_expected.to belong_to(:arrival_location).class_name('Location') }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:departure_location) }
    it { is_expected.to validate_presence_of(:arrival_location) }
    it { is_expected.to validate_presence_of(:departure_at) }
    it { is_expected.to validate_presence_of(:duration) }
    it { is_expected.to validate_presence_of(:capacity) }
    it { is_expected.to validate_uniqueness_of(:departure_at).scoped_to(:departure_location_id, :arrival_location_id) }
    it { is_expected.to validate_numericality_of(:duration) }
    it { is_expected.to validate_numericality_of(:capacity) }
  end
end
