require 'rails_helper'

RSpec.describe GeocodeService do
  describe 'it gets lat and lng for specific places', :vcr do
    it 'gets lat and lng for provo utah' do
      location = 'washington, dc'
      gls = GeocodeService.new
      data = gls.geocode(location)
      result = data[:results].first[:locations].first[:latLng]
      
      expect(result).to be_a Hash
      expect(result[:lat]).to eq(38.89037)
      expect(result[:lng]).to eq(-77.03196)
    end
    
    it 'gets lat and lng for austin texas' do
      location = 'austin, tx'
      gls = GeocodeService.new
      data = gls.geocode(location)
      result = data[:results].first[:locations].first[:latLng]
      
      expect(result).to be_a Hash
      expect(result[:lat]).to eq(30.26759)
      expect(result[:lng]).to eq(-97.74299)
    end
  end
end