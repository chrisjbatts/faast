require_relative './carriage.rb'
require_relative './passenger.rb'

class Station

  DEFAULT_CAPACITY = 1

  def initialize
    @trains ||=[]
    @station_passengers ||=[]
  end

  def arrive(train)
    raise "There is another train on the platform. Get queuing." if station_full?
    @trains << train
  end

  def train_count
    @trains.count
  end

  def depart(train)
    raise "There are no trains on the platform to depart." if station_empty?
    @trains.delete(train)
  end

  def capacity
    @capacity ||= DEFAULT_CAPACITY
  end

  def station_full?
    train_count == capacity
  end

  def station_empty?
    train_count == 0
  end

  def checkin(passenger)
    @station_passengers << passenger
  end

  def checkout(passenger)
    @station_passengers.delete(passenger)
  end

  def station_passengers
    @station_passengers.count
  end

  def enter_faast(passenger)
    @station_passengers << passenger
    passenger.bought_ticket
  end

end