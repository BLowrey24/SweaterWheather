require 'rails_helper'

RSpec.describe BookSearchService do
  it 'can return the destination city', :vcr do
    city = BookSearchService.new.get_books("denver,co")
  end
end