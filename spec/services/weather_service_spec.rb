require 'rails_helper'

RSpec.describe WeatherService do
  it 'can return the current weather and forecast for a location', :vcr do
    location = WeatherService.new.get_weather('39.738453', '-104.984853')

    expect(location).to be_a Hash
    expect(location).to have_key :current
    expect(location[:current]).to have_key :last_updated
    expect(location[:current][:last_updated]).to be_a String
    expect(location[:current]).to have_key :temp_f
    expect(location[:current][:temp_f]).to be_a Float
    expect(location[:current]).to have_key :feelslike_f
    expect(location[:current][:feelslike_f]).to be_a Float
    expect(location[:current]).to have_key :humidity
    expect(location[:current][:humidity]).to be_a Integer
    expect(location[:current]).to have_key :uv 
    expect(location[:current][:uv]).to be_a Float
    expect(location[:current]).to have_key :vis_miles
    expect(location[:current][:vis_miles]).to be_a Float
    expect(location).to have_key :forecast
    expect(location[:forecast][:forecastday]).to be_an Array
    expect(location[:forecast][:forecastday][0][:day]).to have_key :condition
    expect(location[:forecast][:forecastday][0][:day][:condition]).to have_key :text
    expect(location[:forecast][:forecastday][0][:day][:condition][:text]).to be_a String
    expect(location[:forecast][:forecastday][0][:day][:condition]).to have_key :icon
    expect(location[:forecast][:forecastday][0][:day][:condition][:icon]).to be_a String
  end
end