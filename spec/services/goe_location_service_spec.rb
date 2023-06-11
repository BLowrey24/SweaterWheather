require 'rails_helper'

RSpec.describe GeocodeService do
  it 'gets lat and lng for provo utah' do
    location = 'washington, dc'
    gls = GeocodeService.new
    data = gls.geocode(location)
    result = data[:results].first[:locations].first[:latLng]

    expect(result).to be_a Hash
    expect(result[:lat]).to eq(38.892062)
    expect(result[:lng]).to eq(-77.019912)
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