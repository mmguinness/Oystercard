class Oystercard 
  attr_accessor :balance
  attr_accessor :journey_status

  MAXIMUM_CREDIT = 90
  MINIMUM_BALANCE = 1

  def initialize
    @balance = 0
    @journey_status = false
  end

  def topup(credit)
    fail "Maximum balance #{MAXIMUM_CREDIT}" if (@balance + credit) > MAXIMUM_CREDIT
    @balance += credit
  end

  def touch_in
    fail "Minimum balance #{MINIMUM_BALANCE}" if @balance < MINIMUM_BALANCE
    @journey_status = true
  end

  def touch_out
    @journey_status = false
    deduct
  end

  def in_journey?
    @journey_status
  end
  
  private
  
  def deduct
    @balance -= MINIMUM_BALANCE
  end

end