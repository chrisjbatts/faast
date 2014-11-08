require_relative '../lib/passenger.rb'
require_relative '../lib/station.rb'
require_relative '../lib/carriage.rb'

describe Passenger do

  let(:passenger) { Passenger.new }
  let(:station) { Station.new }
  let(:carriage) { Carriage.new }

  it 'must be able to get on a train from a station' do
    station.checkin(passenger)
    passenger.board(carriage, station)
    expect(station.station_passengers).to eq(0)
  end

  it 'must be able to exit a train to a station' do
    carriage.embark(passenger)
    passenger.unload(carriage, station)
    expect(station.station_passengers).to eq(1)
  end

end


# BASIC TESTS
# allow a passenger to transfer from station to carriage - done
# allow a passenger to transfer from carriage to station - done

# ADVANCED TESTS
# Prevent entry to the faast system if passenger balance below GBP2.00
# Charge GBP1.50 entry to the faast system (each journey)