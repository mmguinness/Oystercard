class Oystercard 
  attr_accessor :balance
  attr_accessor :journey_status

  MAXIMUM_CREDIT = 90

  def initialize
    @balance = 0
    @journey_status = false
  end

  def topup(credit)
    fail "Maximum balance #{MAXIMUM_CREDIT}" if (@balance + credit) > MAXIMUM_CREDIT
    @balance += credit
  end

  def deduct(fare)
    @balance -= fare
  end

  def touch_in
    @journey_status = true
  end

  def touch_out
    @journey_status = false
  end

  def in_journey?
    @journey_status
  end

end