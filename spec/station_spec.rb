require_relative '../lib/station.rb'

describe Station do

  let(:station) { Station.new }
  let(:carriage) { Carriage.new }
  let(:train) { double :train }
  let(:passenger) { double :passenger, bought_ticket: 4.00 }

  it 'must allow a train to enter the station' do
    station.arrive(train)
    expect(station.train_count).to eq(1)
  end

  it 'must allow a train to depart the station' do
    station.arrive(train)
    station.depart(train)
    expect(station.train_count).to eq(0)
  end

  it 'must allow a passenger to enter the station from outside the faast system' do
    station.enter_faast(passenger)
    expect(station.station_passengers).to eq(1)
  end

  it 'must allow a passenger to exit to the outside world from the faast system' do
    station.enter_faast(passenger)
    station.checkout(passenger)
    expect(station.station_passengers).to eq(0)
  end

end








# BASIC TESTS
# allow a train to enter - done
# allow a train to exit - done
# enter a passenger to the station from outside the faast system - done
# exit a passenger from thge station to outside the faast system - done
