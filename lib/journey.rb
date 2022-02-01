class Journey
  attr_reader = :active
  attr_reader = :fare

  def initialize
    @active = true
  end

  def active
    @active
  end

  def finish
    @active = false
  end

  def fare
    if  @active == true
      Oystercard::PENALTY_FARE 
    else
      Oystercard::MINIMUM_BALANCE 
    end
  end

  def new_journey
    raise "Journey in progress!" if @active != false
    @active = true
  end
end
