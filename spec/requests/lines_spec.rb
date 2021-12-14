# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Lines', type: :request do
  describe 'GET /lines' do
    let!(:line) { create(:line) }

    it 'render lines list' do
      get '/lines'
      expect(response).to have_http_status(:ok)
      item = json_response.first
      expect(item['id']).to eq(line.id)
      expect(item['departure_location']).to include('id' => line.departure_location.id)
      expect(item['arrival_location']).to include('id' => line.arrival_location.id)
      expect(item['departure_at']).to eq(line.departure_at.as_json)
      expect(item['duration']).to eq(line.duration)
      expect(item['capacity']).to eq(line.capacity)
      expect(item['tickets_count']).to eq(line.tickets_count)
      expect(item['price']).to eq('cents' => line.price.cents, 'currency_iso' => line.price.currency)
    end
  end
end
