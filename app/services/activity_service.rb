class  ActivityService
  def get_activities(location)
    get_url("/api/activity?destination=#{location}")
  end

  private
    def conn 
      Faraday.new(url: 'https://www.boredapi.com')
    end

    def get_url(url)
      response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end
end