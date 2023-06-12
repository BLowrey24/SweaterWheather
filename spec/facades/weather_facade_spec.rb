require 'rails_helper'

RSpec.describe WeatherFacade do
  describe 'class methods' do
    it 'returns a weather object for a given location', :vcr => { :record => :new_episodes } do
        facade = WeatherFacade.new('denver,co')
        weather_object = facade.weather
        
        expect(weather_object).to be_a Weather
        expect(weather_object.current_weather).to be_a Hash
        expect(weather_object.current_weather).to have_key :last_updated
        expect(weather_object.current_weather).to have_key :temperature
        expect(weather_object.current_weather).to have_key :feels_like
        expect(weather_object.current_weather).to have_key :humidity
        expect(weather_object.current_weather).to have_key :uvi
        expect(weather_object.current_weather).to have_key :visibility
        expect(weather_object.current_weather).to have_key :conditions
        expect(weather_object.current_weather).to have_key :icon

        expect(weather_object.daily_weather).to be_an Array
        expect(weather_object.daily_weather.count).to eq(5)
        expect(weather_object.daily_weather.first).to be_a Hash
        expect(weather_object.daily_weather.first).to have_key :date
        expect(weather_object.daily_weather.first).to have_key :sunrise
        expect(weather_object.daily_weather.first).to have_key :sunset
        expect(weather_object.daily_weather.first).to have_key :max_temp
        expect(weather_object.daily_weather.first).to have_key :min_temp
        expect(weather_object.daily_weather.first).to have_key :conditions
        expect(weather_object.daily_weather.first).to have_key :icon

        expect(weather_object.hourly_weather).to be_an Array
        expect(weather_object.hourly_weather.count).to eq(24)
        expect(weather_object.hourly_weather.first).to be_a Hash
        expect(weather_object.hourly_weather.first).to have_key :time
        expect(weather_object.hourly_weather.first).to have_key :temperature
        expect(weather_object.hourly_weather.first).to have_key :conditions
        expect(weather_object.hourly_weather.first).to have_key :icon
    end
  end
end