class Station
  
  attr_reader :name
  attr_reader :zone

  def initialize(name, zone)
    @name = name
    @zone = zone
  end
end

# module Station
#   NAME = "station name"
#   ZONE = "station zone"
# end