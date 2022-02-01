 # oystercard

#  Working through chapter 14 without a touch_in

#  Card will deduct the fare when touching out
#  but need to clear the station information and journey status
#  and update tests to pass with new 'Journey' class.

IRB functionality:

admin@Maries-MacBook-Pro oystercard_2 % irb
3.1.0 :001 > require './lib/journey'
 => true
3.1.0 :002 > require './lib/station'
 => true
3.1.0 :003 > require './lib/oystercard'
 => true
3.1.0 :004 > station = Station.new("station", "zone 1")
 => #<Station:0x000000010bf70588 @name="station", @zone="zone 1">
3.1.0 :005 > card = Oystercard.new
 =>
#<Oystercard:0x000000010bf299d0
...
3.1.0 :006 > card.topup(20)
 => 20
3.1.0 :007 > card.touch_in(station)
 => [#<Station:0x000000010bf70588 @name="station", @zone="zone 1">]
3.1.0 :008 > card.touch_out(station)
 => 14
3.1.0 :009 > card
 =>
#<Oystercard:0x000000010bf299d0                        
 @balance=14,                                          
 @entry_station=[#<Station:0x000000010bf70588 @name="station", @zone="zone 1">],
 @exit_station=[#<Station:0x000000010bf70588 @name="station", @zone="zone 1">],
 @history=[],                                          
 @holder_journey=#<Journey:0x000000010bf29728 @active=true>>
3.1.0 :010 >
