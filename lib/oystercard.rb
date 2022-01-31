class Oystercard 
  attr_accessor :balance
  MAXIMUM_CREDIT = 90

  def initialize
    @balance = 0
  end

  def topup(credit)
    fail "Maximum balance #{MAXIMUM_CREDIT}" if (@balance + credit) > MAXIMUM_CREDIT
    @balance += credit
  end

end