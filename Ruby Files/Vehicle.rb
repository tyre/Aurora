require 'awesome_print'
require_relative "Location.rb"
require_relative "Driver.rb"
require_relative "Trip.rb"

class Vehicle
  attr_accessor :driver, :location
  attr_reader :routes, :current_route, :current_step, :vehicle_id, :time_to_final, :time_to_next
  private :dropoff
  def initialize(id,location=Location.new(38.915924,-76.984061))
    #defaults to LS HQ, no driver. Yikes!
    @vehicle_id = id
    @routes = Array.new
    @current_route = nil
    @current_step = nil
    @location = location
  end

  def pickup(dest, package)
    if @routes.last!= nil
      #append new trip to this dest
      @routes << Trip.new(@routes.last.destination, dest, self, package)
      @time_to_final += @routes.last.total_time
    else
      @routes << Trip.new(@location, dest, self, package) # go straight to dest, no current trips
      @current_route = @routes[0].steps.to_enum
      @time_to_final = @routes[0].total_time
      @time_to_next = @routes[0].total_time
      next_step()
    end
  end

  def next_step #takes the next step in a route
    begin
      c = @current_step
      @current_step = @current_route.next
      @location = @current_step.orig
      if c != nil #on the first step of first trip, no need to decrement for previous step
        @time_to_final -= c.dur
        @time_to_next -= c.dur
      end
    rescue StopIteration
      c = @current_step
      @time_to_final -= c.dur
      @time_to_next = 0
      @current_step = nil
      dropoff #you're at the end of the Trip, time to dropff!
    end
  end

  def dropoff
    popped = @routes.shift
    @location = popped.destination
    @current_route = @routes[0] == nil ? nil : @routes[0].steps.to_enum #if more routes, sets current_route to new iterator
    @time_to_next = @current_route.total_time
    @current_step = t.next
    return popped
  end

  #lost? creates a new Trip from current location to the dest of current_route
  def recalculate
    if @current_route != nil
      d = @current_route.destination
      t = Trip.new(@location, d, self, @current_route.package)
      @time_to_final -= @time_to_next #reset current trip's time
      @time_to_final += t.total_time
      @time_to_next = t.total_time
      @routes[0] = t
      @current_route = t.to_enum
      @current_step = t.next
    end
  end

  #returns the time (in seconds) it would take for Vehicle to get to location
  #assumes that it would slap on the trip at the end
  def time_from(loc)
    if @routes.last != nil
      return Trip.new(@location, loc, self).total_time + @time_to_final
    else #no trips, they can go right there
      return Trip.new(@location, loc, self).total_time
    end
  end

  def next_step? #tells if there are more steps on this route
    begin
      @current_route.peek
    rescue StopIteration
      return false
    end
  end

  def self.total_vehicles
    return ObjectSpace.count_objects["TOTAL"]
  end

  def self.all_vehicles
    return @@vehicles
  end

  def self.find_closest(loc)
    min = 999999999999
    vehicle = nil
    ObjectSpace.each_object(Vehicle) {|v|
      t = v.time_from(loc)
      if t < min
        vehicle = v
        min =  t
      end
    }
    return vehicle
  end

  def self.find_by_driver(driver)
    found = nil
    ObjectSpace.each_object(Vehicle) {|v|
      found = v if v.driver == driver
    }
    found
  end

  def to_s
    if @driver != nil
      ap "#{@driver} is driving this vehicle. Woooooo"
    else
      ap "No one is driving this vehicle. Ahhhhhhh!"
    end
    ap @routes
  end
end