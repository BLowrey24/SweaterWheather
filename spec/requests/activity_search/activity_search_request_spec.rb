require 'rails_helper'

RSpec.describe 'Activity Search API' do
  describe 'Happy Path' do
    it 'returns a activity based on the location requested', :vcr => { :record => :new_episodes } do
      headers = {"CONTENT_TYPE" => "application/json"}
      get "/api/v1/activities?destination=chicago,il", headers: headers
      expect(response).to be_successful
      expect(response.status).to eq(200)

      activity_forecast = JSON.parse(response.body, symbolize_names: true)

      expect(activity_forecast).to be_a Hash
      expect(activity_forecast).to have_key :data
      expect(activity_forecast[:data]).to be_a Hash
      expect(activity_forecast[:data]).to have_key :id
      expect(activity_forecast[:data][:id]).to eq(nil)
      expect(activity_forecast[:data]).to have_key :type
      expect(activity_forecast[:data][:type]).to eq('activity')
      expect(activity_forecast[:data]).to have_key :attributes
      expect(activity_forecast[:data][:attributes]).to be_a Hash
      expect(activity_forecast[:data][:attributes]).to have_key :forecast
      expect(activity_forecast[:data][:attributes][:forecast]).to be_a Hash
      expect(activity_forecast[:data][:attributes][:forecast]).to have_key :summary
      expect(activity_forecast[:data][:attributes][:forecast][:summary]).to be_a String
      expect(activity_forecast[:data][:attributes][:forecast]).to have_key :temperature
      expect(activity_forecast[:data][:attributes][:forecast][:temperature]).to be_a String
      expect(activity_forecast[:data][:attributes]).to have_key :activities
      expect(activity_forecast[:data][:attributes][:activities]).to be_a Hash
      expect(activity_forecast[:data][:attributes][:activities].first).to be_a Array
      expect(activity_forecast[:data][:attributes][:activities].first[1]).to be_an Hash
      expect(activity_forecast[:data][:attributes][:activities].first[1]).to have_key :type
      expect(activity_forecast[:data][:attributes][:activities].first[1][:type]).to be_a String
      expect(activity_forecast[:data][:attributes][:activities].first[1]).to have_key :participants
      expect(activity_forecast[:data][:attributes][:activities].first[1][:participants]).to be_a Integer
      expect(activity_forecast[:data][:attributes][:activities].first[1]).to have_key :price
      expect(activity_forecast[:data][:attributes][:activities].first[1][:price]).to be_a Float
    end
  end
end