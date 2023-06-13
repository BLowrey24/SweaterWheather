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

  describe 'sad path' do
    it 'returns an error if email is missing' do
      post '/api/v1/users', params: { user: { password: "password", password_confirmation: "password" } }
      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      body = JSON.parse(response.body, symbolize_names: true)
      
      expect(body).to be_a Hash
      expect(body).to have_key :errors
      expect(body[:errors]).to be_a Array
      expect(body[:errors][0]).to be_a Hash
      expect(body[:errors][0]).to have_key :detail
      expect(body[:errors][0][:detail]).to eq("email or password are invalid or missing")
    end
  end
end