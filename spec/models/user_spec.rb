# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'password' do
    it { is_expected.to have_secure_password }
  end

  describe 'enums' do
    it { is_expected.to define_enum_for(:role).with_values(%i[passenger conductor admin]) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email) }
    it { is_expected.not_to allow_value('abc.example').for(:email) }
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
  end

  describe '#api_token' do
    subject { user.api_token }

    let(:user) { create(:user) }

    it { is_expected.to be_present }
  end
end
