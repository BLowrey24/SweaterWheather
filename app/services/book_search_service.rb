class BookSearchService

  def get_books(city)
    require 'pry'; binding.pry
    get_url("/api/v1/book-search?location=#{city}&quantity=5")
  end

  private
    def conn 
      Faraday.new(url: 'https://openlibrary.org')
    end

    def get_url(url)
      require 'pry'; binding.pry
      response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end
end