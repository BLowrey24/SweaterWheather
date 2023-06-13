require 'rails_helper'

RSpec.describe 'User Creation' do
  describe 'happy path' do
    it 'after user creation it returns their api key' do
      post '/api/v1/users', params: { user: { email: "baston@example.com", password: "password", password_confirmation: "password" } }
      expect(response).to be_successful
      expect(response.status).to eq(201)
      body = JSON.parse(response.body, symbolize_names: true)

      expect(body).to be_a Hash
      expect(body[:data]).to be_a Hash
      expect(body[:data][:type]).to eq("users")
      expect(body[:data][:id]).to be_a String
      expect(body[:data][:attributes]).to be_a Hash
      expect(body[:data][:attributes][:email]).to eq("baston@example.com")
      expect(body[:data][:attributes][:api_key]).to be_a String
    end
  end
end