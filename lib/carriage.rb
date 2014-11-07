class Carriage

  DEFAULT_CAPACITY = 40

  def initialize
    @passengers ||=[]
  end

  def embark(passenger)
    raise "Full fool" if full?
    @passengers << passenger
  end

  def passenger_count
    @passengers.count
  end

  def disembark(passenger)
    raise "Nobody left in the carriage" if empty?
    @passengers.pop
  end

  def capacity
    @capacity ||= DEFAULT_CAPACITY
  end

  def full?
    passenger_count == capacity
  end

  def empty?
    passenger_count == 0
  end

end