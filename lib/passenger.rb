class Passenger

  def initialize
    @crustacian_card = 4.00
  end

  def board(carriage, station)
    carriage.embark(self)
    station.checkout(self)
  end

  def unload(carriage, station)
    carriage.disembark(self)
    station.checkin(self)
  end

  def crustacian_card
    @crustacian_card
  end

  def bought_ticket
    raise "Time to spend some cash - not enough money on your crustacian card" if low_balance?
    @crustacian_card -= 1.50
  end

  def low_balance?
    @crustacian_card <= 2.00
  end

end