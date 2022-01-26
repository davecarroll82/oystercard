class Oystercard
  MAX_BALANCE = 90
  
  attr_reader :balance

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(balance)
    fail "Maximum balance of #{MAX_BALANCE} was exceeded" if @balance + balance > MAX_BALANCE
    @balance += balance
  end

  def spend(balance)
    @balance -= balance
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    fail "Insufficient funds to touch in" if @balance < 1
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end
end