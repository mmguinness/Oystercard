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

  # def journey_complete?
  #   if  @active == false
  #     "Journey complete"
  #   else
  #     "journey incomplete"
  #   end
  # end
end
