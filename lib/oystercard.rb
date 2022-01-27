class Oystercard
  MAX_BALANCE = 90
  MIN_BALANCE = 1
  
  attr_reader :balance, :entry_station, :exit_station, :journey_list

  def initialize
    @balance = 0
    @journey_list = []
  end

  def top_up(balance)
    fail "Maximum balance of #{MAX_BALANCE} was exceeded" if @balance + balance > MAX_BALANCE
    @balance += balance
  end

  def in_journey?
    !!entry_station
  end

  def touch_in(station)
    fail "Insufficient funds to touch in" if @balance < MIN_BALANCE
    @entry_station = station
  end

  def touch_out(station)
    spend(MIN_BALANCE)
    @exit_station = station
    journeys
    @entry_station = nil
  end

  def journeys
    journey = {entry_station: @entry_station, exit_station: @exit_station}
    @journey_list.push(journey)
  end

  private
  def spend(balance)
    @balance -= balance
  end
end