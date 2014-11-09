require_relative '../lib/passenger.rb'
require_relative '../lib/station.rb'
require_relative '../lib/carriage.rb'

describe Passenger do

  let(:passenger) { Passenger.new }
  let(:station) { Station.new }
  let(:carriage) { Carriage.new }

  def made_a_journey(passenger)
    station.enter_faast(passenger)
    station.checkout(passenger)
  end

  def made_two_journeys(passenger)
    2.times {made_a_journey(passenger)}
  end

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

  it 'must have 1.50 deducted from their crustacian card for each journey' do
    station.enter_faast(passenger)
    expect(passenger.crustacian_card).to eq(2.50)
  end

  it 'must prevent the passenger from making a journey if crustacian card balance less than 2.01' do
    made_two_journeys passenger
    expect(lambda { made_a_journey passenger }).to raise_error(RuntimeError)
  end

end


# BASIC TESTS
# allow a passenger to transfer from station to carriage - done
# allow a passenger to transfer from carriage to station - done

# ADVANCED TESTS
# charge GBP1.50 entry to the faast system (each journey) - done
# prevent entry to the faast system if passenger balance below GBP2.00 - done