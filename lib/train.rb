class Train

  DEFAULT_CAPACITY = 12

  def initialize
    @carriages ||=[]
  end

  def couple(carriage)
    raise "The train is too long to fit the platforms" if full?
    @carriages << carriage
  end

  def carriage_count
    @carriages.count
  end

  def decouple(carriage)
    raise "No carriages left to decouple" if empty?
    @carriages.delete(carriage)
  end

  def capacity
    @capacity ||= DEFAULT_CAPACITY
  end

  def full?
    carriage_count == capacity
  end

  def empty?
    carriage_count == 0
  end

end