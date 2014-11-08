require_relative '../lib/carriage.rb'

describe Carriage do

  let(:carriage) { Carriage.new }
  let(:passenger) { double :passenger }

  def cram_them_in(carriage)
    carriage.capacity.times { carriage.embark(passenger) }
  end

  it 'must allow a passenger to embark' do
    expect(carriage.passenger_count).to eq(0)
    carriage.embark(passenger)
    expect(carriage.passenger_count).to eq(1)
  end

  it 'must allow a passenger to disembark' do
    carriage.embark(passenger)
    carriage.disembark(passenger)
    expect(carriage.passenger_count).to eq(0)
  end

  it 'must only allow a total of forty people to be on board' do
    cram_them_in carriage
    expect(lambda { carriage.embark(passenger) }).to raise_error(RuntimeError)
  end

  it "must only allow a passenger to disembark if they exist" do
    expect(lambda { carriage.disembark(passenger) }).to raise_error(RuntimeError)
  end

end


# BASIC TESTS
# must collect passengers - done
# must drop off passengers - done
# deny access to people when full (40 people) - done
# must not allow a non-existent passenger to disembark - done