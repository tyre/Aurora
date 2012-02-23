$: << '.'

require_relative 'Taxi.rb'
require 'awesome_print'

v = Taxi.new(7)
d = Driver.new("Chris", "Maddox", 2000903)
v.driver = d
l = Location.new("1205 Hollins Lane Baltimore MD 21209")
v.pickup(l, 3)
ap v.current_step
v.next_step
ap v.current_step
v.next_step
ap v.current_step
v.next_step
ap v.current_step
v.next_step
ap v.current_step
v.next_step
ap v.current_step
v.next_step
ap v.current_step
v.next_step
ap v.current_step
v.next_step
ap v.current_step
v.next_step
ap v.current_step
v.next_step
ap v.current_step
v.next_step
ap v.current_step
v.next_step
ap v.current_step
