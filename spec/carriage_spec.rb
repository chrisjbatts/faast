require 'carriage'

describe Carriage do

  # let(:train) { double :train }
  let(:passenger) { double :passenger }
  let(:carriage) { Carriage.new }

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


# BASIC FUNCTIONALITY
# must collect passengers - done
# must drop off passengers - done
# deny access to people when full (40 people) - done
# must not allow a non-existent passenger to disembark - done

# ADVANCED TESTS
# must make up part of the train 
# Must only allow doors to open when train at station
# must collect passengers from platform
# must drop off passengers on platform