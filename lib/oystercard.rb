class Oystercard
  MAX_BALANCE = 90
  
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(balance)
    fail "Maximum balance of #{MAX_BALANCE} was exceeded" if @balance + balance > MAX_BALANCE
    @balance += balance
  end

  def spend(balance)
    @balance -= balance
  end
end