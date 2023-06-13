require 'rails_helper'

RSpec.describe "User Login" do  
  before(:each) do
    @user = User.create!(email: "baston@example.com", password: "password", password_confirmation: "password")
  end
  describe 'happy path' do
    it 'can log in a user' do
      post '/api/v1/sessions', params: { email: "baston@example.com", password: "password" } 
      expect(response).to be_successful
      expect(response.status).to eq(200)

      body = JSON.parse(response.body, symbolize_names: true)
      expect(body[:data][:type]).to eq("users")
      expect(body[:data][:id]).to eq(@user.id.to_s)
      expect(body[:data][:attributes][:email]).to eq(@user.email)
      expect(body[:data][:attributes][:api_key]).to eq(@user.api_key)
    end
  end

  describe 'sad path' do
    it 'returns an error if email does not match' do
      post '/api/v1/sessions', params: { email: "incorrect email", password: "password" }
      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      body = JSON.parse(response.body, symbolize_names: true)
      expect(body[:errors][0][:detail]).to eq("Invalid credentials")
    end

    it 'returns an error if password does not match' do
      post '/api/v1/sessions', params: { email: "baston@example.com", password: "incorrect password" } 
      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      body = JSON.parse(response.body, symbolize_names: true)
      expect(body[:errors][0][:detail]).to eq("Invalid credentials")
    end
  end
end