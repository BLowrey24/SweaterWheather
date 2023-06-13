class WeatherFacade
  def initialize(location)
    @location = location
    @lat = get_location[:lat]
    @lng = get_location[:lng]
  end

  def weather
    @_weather ||= Weather.new(format_weather_data)
  end

  def activities_by_location
    @_activities_by_location ||= Activity.new(format_forecast, format_activity_data)
  end

  private

    def geocode_service
      @_location_service ||= GeocodeService.new
    end

    def weather_service
      @_weather_service ||= WeatherService.new
    end

    def activity_data
      @_activity_data ||= activity_service.get_activities(@location)
    end

    def activity_service
      @_activity_service ||= ActivityService.new
    end

    def get_location
      @_get_location ||= geocode_service.geocode(@location)[:results][0][:locations][0][:latLng]
    end

    def get_weather
      @_get_weather ||= weather_service.get_weather(@lat, @lon)
    end

    def format_weather_data
        {
          current_weather: current_weather,
          daily_weather: daily_weather,
          hourly_weather: hourly_weather
        }
    end

    def current_weather
      {
        last_updated: get_weather[:current][:last_updated],
        temperature: get_weather[:current][:temp_f],
        feels_like: get_weather[:current][:feelslike_f],
        humidity: get_weather[:current][:humidity],
        uvi: get_weather[:current][:uv],
        visibility: get_weather[:current][:vis_miles],
        conditions: get_weather[:current][:condition][:text],
        icon: get_weather[:current][:condition][:icon]
      }
    end

    def daily_weather
      get_weather[:forecast][:forecastday][1..5].map do |day|
      {
        date: day[:date],
        sunrise: day[:astro][:sunrise],
        sunset: day[:astro][:sunset],
        max_temp: day[:day][:maxtemp_f],
        min_temp: day[:day][:mintemp_f],
        conditions: day[:day][:condition][:text],
        icon: day[:day][:condition][:icon]
      }
      end
    end

    def hourly_weather
      get_weather[:forecast][:forecastday][0][:hour].map do |hour|
      {
        time: hour[:time],
        temperature: hour[:temp_f],
        conditions: hour[:condition][:text],
        icon: hour[:condition][:icon]
      }
      end
    end

    def format_activity_data
      {
        activities:
          {
            "#{activity_data[:activity]}": 
            {
              "type": activity_data[:type],
              "participants": activity_data[:participants],
              "price": activity_data[:price]
            }
          }
      }
    end

    def format_forecast
      {
        destination: @location,
        forecast: {
          summary: weather.current_weather[:condition],
          temperature: "#{weather.current_weather[:temperature]} F"
        }
      }
    end
end