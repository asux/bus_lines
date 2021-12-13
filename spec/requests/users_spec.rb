# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:user_attributes) do
    attributes_for(:user).slice(:email,
                                :first_name,
                                :last_name,
                                :password)
  end

  describe 'GET /users' do
    let!(:user) { create(:user) }

    it 'render users list' do
      get "/users"
      expect(response).to have_http_status(:ok)
      item = json_response.first
      expect(item['email']).to eq(user.email)
      expect(item['first_name']).to eq(user.first_name)
      expect(item['last_name']).to eq(user.last_name)
      expect(item['role']).to eq(user.role)
    end
  end

  describe 'POST /users' do
    it 'creates user' do
      post '/users', params: { user: user_attributes }
      expect(response).to have_http_status(:ok)
      expect(json_response['email']).to eq(user_attributes[:email])
      expect(json_response['first_name']).to eq(user_attributes[:first_name])
      expect(json_response['last_name']).to eq(user_attributes[:last_name])
      expect(json_response['role']).to eq('passenger')
    end
  end

  describe 'GET /users/:id' do
    let!(:user) { create(:user) }

    it 'renders user' do
      get "/users/#{user.id}"
      expect(response).to have_http_status(:ok)
      expect(json_response['email']).to eq(user.email)
      expect(json_response['first_name']).to eq(user.first_name)
      expect(json_response['last_name']).to eq(user.last_name)
      expect(json_response['role']).to eq(user.role)
    end
  end
end
