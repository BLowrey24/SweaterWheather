class  ActivityService
  def get_activities(location)
    get_url("/api/activity?destination=#{location}")
  end

  def get_recreational_activity
    get_url("/api/activity?type=recreational")
  end

  def get_busywork_activity
    get_url("/api/activity?type=busywork")
  end

  def get_cooking_activity
    get_url("/api/activity?type=cooking")
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