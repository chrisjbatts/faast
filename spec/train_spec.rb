require_relative "../lib/train.rb"

describe Train do

  let(:train) { Train.new }
  let(:carriage) { double :carriage }

  def longest_length(train)
    train.capacity.times { train.couple(carriage) }
  end

  it 'must be able to add a carriage' do
    train.couple(carriage)
    expect(train.carriage_count).to eq(1)
  end

  it 'must be able to remove a carriage' do
    train.couple(carriage)
    train.decouple(carriage)
    expect(train.carriage_count).to eq(0)
  end

  it 'must prevent the train being too long to enter platforms' do
    longest_length train
    expect(lambda { train.couple(carriage) }).to raise_error(RuntimeError)
  end

  it 'must prevent a carriage being released if none are left' do
    expect(lambda { train.decouple(carriage) }).to raise_error(RuntimeError)
  end

end


# BASIC TESTS
# add a carriage - done
# remove a carriage - done

# ADVANCED TESTS
# have a maximum number of carriages (to fit in the station) - done
# prevent a carriage being decoupled if none exist - done