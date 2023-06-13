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

    it 'returns a book-search object for a given location, with some weather', :vcr => { :record => :new_episodes } do
      activities_by_location = WeatherFacade.new('chicago,il').activities_by_location
      
      expect(activities_by_location).to be_a Books
      expect(activities_by_location.destination).to eq('denver,co')
      expect(activities_by_location.forecast).to be_a Hash
      expect(activities_by_location.forecast).to have_key :summary
      expect(activities_by_location.forecast).to have_key :temperature
      expect(activities_by_location.total_books_found).to be_an Integer
      expect(activities_by_location.books).to be_an Array
      expect(activities_by_location.books.count).to eq(5)
      expect(activities_by_location.books.first).to be_a Hash
      expect(activities_by_location.books.first).to have_key :isbn
      expect(activities_by_location.books.first[:isbn]).to be_an Array
      expect(activities_by_location.books.first[:isbn].first).to be_a String
      expect(activities_by_location.books.first).to have_key :title
      expect(activities_by_location.books.first[:title]).to be_a String
      expect(activities_by_location.books.first).to have_key :publisher
      expect(activities_by_location.books.first[:publisher]).to be_an Array
      expect(activities_by_location.books.first[:publisher].first).to be_a String
    end
  end
end