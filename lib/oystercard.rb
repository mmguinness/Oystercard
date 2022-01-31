class Oystercard 
  attr_accessor :balance
  # attr_accessor :journey_status
  attr_reader :entry_station

  MAXIMUM_CREDIT = 90
  MINIMUM_BALANCE = 1

  def initialize
    @balance = 0
    # @journey_status = false
    @entry_station = []
  end

  def topup(credit)
    fail "Maximum balance #{MAXIMUM_CREDIT}" if (@balance + credit) > MAXIMUM_CREDIT
    @balance += credit
  end

  def touch_in(station_name)
    fail "Minimum balance #{MINIMUM_BALANCE}" if @balance < MINIMUM_BALANCE
    in_journey?
    @entry_station << station_name
  end

  def touch_out
    in_journey?
    deduct
    @entry_station.clear
  end

  def in_journey?
    @entry_station.length > 0
  end
  
  private
  
  def deduct
    @balance -= MINIMUM_BALANCE
  end

end