require_relative '../lib/oystercard'
require_relative '../lib/station'

describe 'Station' do

  it 'should tell you what zone it is in' do
    station = Station.new("station", "zone 1")
    expect(station.zone).to eq("zone 1")
  end

  it 'should tell you what its name is' do
    station = Station.new("station", "zone 1")
    expect(station.name).to eq("station")
  end

end