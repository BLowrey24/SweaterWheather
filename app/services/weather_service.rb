class  WeatherService

  def get_weather(lat_lon)
    response = conn.get("current.json?q=#{lat_lon}}")
    JSON.parse(response.body, symbolize_names: true)
  end


  private

    def conn
      Faraday.new(url: "http://api.weatherapi.com/v1") do |f|
        f.params['key'] = ENV['WEATHER_API_KEY']
      end
    end
end