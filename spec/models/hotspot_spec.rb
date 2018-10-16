require "rails_helper"

describe Hotspot do
  it 'geocodes addresses' do
    mock_geocoding!
    hotspot = Hotspot.new

    geocoded_hotspot = hotspot.geocode

    expect(geocoded_hotspot.latitude).to eq 40.71
    expect(geocoded_hotspot.longtitude).to eq(-100.23)
  end

  def mock_geocoding!(options = {})
    options.reverse_merge!(
      address: '123 Main St, Durham, 27705',
      coordinates: [100.23, 200.68],
      state: 'North Carolina',
      state_code: 'NC',
      country: 'United States',
      country_code: 'US'
    )

    MockResult.new.tap do |result|
      options.each do |prop, val|
        allow(result).to receive(prop).and_return(val)
      end
      allow(Geocoder).to receive(:search).and_return([result])
    end
  end

  class MockResult < ::Geocoder::Result::Base
    def initialize(data = [])
      super(data)
    end
  end
end
