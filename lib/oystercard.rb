class Oystercard 
  attr_accessor :balance
  attr_reader :entry_station

  MAXIMUM_CREDIT = 90
  MINIMUM_BALANCE = 1

  def initialize
    @balance = 0
    @entry_station = []
    @exit_station = []
    @history = []
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

  def touch_out(station_name)
    in_journey?
    deduct
    @exit_station << station_name
    self.save_history
  end

  def in_journey?
    @entry_station.length > 0
  end

  def history
    @history
  end
  
  private

  def save_history
    journey = Hash.new
    journey[:entry] = @entry_station.pop
    journey[:exit] = @exit_station.pop
    @history << journey
  end
  
  def deduct
    @balance -= MINIMUM_BALANCE
  end

end