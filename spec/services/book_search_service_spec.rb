require 'rails_helper'

RSpec.describe BookSearchService do
  it 'can return the destination city', :vcr => { :record => :new_episodes } do
    city = BookSearchService.new.get_books("denver,co", "5")
    expect(city).to be_a Hash
    expect(city[:docs][0]).to have_key :title
    expect(city[:docs][0]).to have_key :publisher
  end
end