# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Locations', type: :request do
  describe 'GET /locations' do
    let!(:location) { create(:location) }

    it 'render locations list' do
      get '/locations'
      expect(response).to have_http_status(:ok)
      item = json_response.first
      expect(item['id']).to eq(location.id)
      expect(item['name']).to eq(location.name)
    end
  end
end
