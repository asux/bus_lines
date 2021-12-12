# frozen_string_literal: true

require 'rails_helper'

Rails.describe ApiToken do
  let(:algorithm) { 'HS256' }
  let(:jwt_secret) { 'my$ecretKey123' }
  let(:expire) { 1.hour }
  let(:api_token) { described_class.new(jwt_secret: jwt_secret, expire: expire) }
  let(:data) { { 'user_id' => 1 } }

  describe '#encode' do
    subject { api_token.encode(data) }

    let(:decoded) { JWT.decode(subject, jwt_secret, true, { algorithm: algorithm }) }

    it 'encodes data' do
      expect(decoded.first['data']).to eq(data)
    end
  end

  describe '#decode' do
    subject { api_token.decode(token) }

    let(:exp_payload) { { data: data, exp: expire.from_now.to_i } }
    let(:token) { JWT.encode(exp_payload, jwt_secret, algorithm) }

    it 'decodes token' do
      expect(subject.first['data']).to eq(data)
    end
  end
end
