$: << '.'

require_relative 'Vehicle.rb'
require 'awesome_print'
#setup drivers and their vehicles
d1 = Driver.new("Chris", "Maddox", 2000903)
d2 = Driver.new("Conor", "Collins", 8675309)
v1 = Vehicle.new(1)
v2 = Vehicle.new(2)
v1.driver = d1
v2.driver = d2
#create locations, put the cars in their places, set pickups
l1 = Location.new("1205 Hollins Lane Baltimore MD 21209")
l2 = Location.new("522 East Seminary Ave Towson MD 21286")
l3 = Location.new("1445 New York Ave, Washington DC 20002")
v1.location = l1
v2.location = l2
v1.pickup(l3, "pizza")
v2.pickup(l3, "pizza")

ap "#{v1.driver} is about to take this step: \n" + v1.current_step.to_s
ap v1.time_to_final
ap v1.time_to_next
v1.next_step
ap v1.time_to_final
ap v1.time_to_next