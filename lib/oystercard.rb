require_relative './journey'

class Oystercard 
  # attr_accessor :balance
  attr_accessor :entry_station
  attr_accessor :exit_station

  MAXIMUM_CREDIT = 90
  MINIMUM_BALANCE = 1
  PENALTY_FARE = 6

  def initialize
    @balance = 0
    @entry_station = []
    @exit_station = []
    @history = []
    @holder_journey = Journey.new
  end

  def topup(credit)
    fail "Maximum balance #{MAXIMUM_CREDIT}" if (@balance + credit) > MAXIMUM_CREDIT
    @balance += credit
  end

  def touch_in(station_name)
    fail "Minimum balance #{MINIMUM_BALANCE}" if @balance < MINIMUM_BALANCE
    @entry_station << station_name
  end

  def touch_out(station_name)
    if holder_journey.active == true then @exit_station << station_name end
    deduct
  end

  def history
    @history
  end

  def holder_journey
    @holder_journey
  end

  def balance
    @balance
  end
  
  # private

  def save_history
    journey = Hash.new
    journey[:entry] = @entry_station.pop
    journey[:exit] = @exit_station.pop
    @history << journey
  end
  
  def deduct
    @balance -= (holder_journey.fare)
  end
end
