require 'rails_helper'

RSpec.describe 'Users API' do
  before(:each) do
    @headers = {"CONTENT_TYPE" => "application/json"}
  end
  describe 'POST /api/v1/users' do
    it 'can create a new user' do
      user = {
        email: "baston@example.com",
        password: "password",
        password_confirmation: "password"
      }
      post "/api/v1/users", headers: @headers, params: JSON.generate(user)
      expect(response).to be_successful
      expect(response.status).to eq(201)

      user_data = JSON.parse(response.body, symbolize_names: true)
      expect(user_data).to be_a Hash
      expect(user_data).to have_key :data
      expect(user_data[:data]).to be_a Hash
      expect(user_data[:data]).to have_key :id
      expect(user_data[:data][:id]).to be_a String
      expect(user_data[:data]).to have_key :type
      expect(user_data[:data][:type]).to eq('users')
      expect(user_data[:data]).to have_key :attributes
      expect(user_data[:data][:attributes]).to be_a Hash
      expect(user_data[:data][:attributes]).to have_key :email
      expect(user_data[:data][:attributes][:email]).to be_a String
      expect(user_data[:data][:attributes]).to have_key :api_key
      expect(user_data[:data][:attributes][:api_key]).to be_a String
      expect(user_data[:data][:attributes]).to_not have_key :password_digest
    end

    it 'returns an error if email is already taken' do
      User.create!(email: "baston@example.com", password: "password", api_key: "lfdkgj34t98sd34dfhj")
      user_email_taken = {
        email: "baston@example.com",
        password: "password",
        password_confirmation: "password"
      }
      post "/api/v1/users", headers: @headers, params: JSON.generate(user_email_taken)
      expect(response).to_not be_successful
      expect(response.status).to eq(409)

      body = JSON.parse(response.body, symbolize_names: true)
      expect(body).to be_a Hash
      expect(body).to have_key :errors
      expect(body[:errors]).to be_a Array
      expect(body[:errors][0]).to be_a Hash
      expect(body[:errors][0]).to have_key :detail
      expect(body[:errors][0][:detail]).to eq("Validation failed: Email has already been taken")
    end

    it 'returns an error if password and confirmation_password do not match' do
      user_passwords_dont_match = {
        email: "baston@example.com",
        password: "password",
        password_confirmation: "notmypassword"
      }
      post "/api/v1/users", headers: @headers, params: JSON.generate(user_passwords_dont_match)
      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      body = JSON.parse(response.body, symbolize_names: true)
      expect(body[:errors][0][:detail]).to eq("Your passwords do not match")
    end

    it 'returns an error if email is missing' do
      user_no_email = {
        email: "",
        password: "password",
        password_confirmation: "password"
      }
      post "/api/v1/users", headers: @headers, params: JSON.generate(user_no_email)
      expect(response).to_not be_successful
      expect(response.status).to eq(422)

      body = JSON.parse(response.body, symbolize_names: true)
      expect(body[:errors][0][:detail]).to eq("Validation failed: Email can't be blank")
    end
  end
end