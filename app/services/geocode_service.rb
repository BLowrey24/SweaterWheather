class GeocodeService

  def geocode(location)
    response = conn.get("?location=#{location}")
    JSON.parse(response.body, symbolize_names: true)
  end


  private
    def conn
      faraday = Faraday.new(url: "https://www.mapquestapi.com/geocoding/v1/address") do |f|
        f.params['key'] = ENV['GEO_LOCATION_API_KEY']
      end
    end
end