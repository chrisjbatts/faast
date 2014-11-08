class Passenger

  def board(carriage, station)
    carriage.embark(self)
    station.checkout(self)
  end

  def unload(carriage, station)
    carriage.disembark(self)
    station.checkin(self)
  end

end