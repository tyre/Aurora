require 'awesome_print'
require_relative "Location.rb"
require_relative "Driver.rb"
require_relative "Trip.rb"

class Vehicle
	attr_accessor :driver, :location
	attr_reader :routes, :current_route, :current_step, :vehicle_id
	
	def initialize(id,location=Location.new(38.915924,-76.984061))
		#defaults to LS HQ, no driver. Yikes!
		@vehicle_id = id
		@routes = Array.new
		@current_route = nil
		@current_step = nil
		if location.is_a? Location
			@location = location
		else
			raise "current location must be of type Location"
		end
	end

	def pickup(dest, package)
		if dest.is_a? Location
			if @routes.last!= nil
				@routes << Trip.new(@routes.last.destination, dest, self, package) #append new trip to this dest

			else
				@routes << Trip.new(@location, dest, self, package) # go straight to dest, no current trips
				@current_route = @routes[0].steps.to_enum
				next_step()
			end
		else
			raise "destination must be a Location"
		end
	end

	def dropoff
		popped = @routes.shift
		@location = popped.destination
		@current_route = @routes[0] == nil ? nil : @routes[0].steps.to_enum #if more routes, sets current_route to new iterator
 		return popped
	end

	def next_step
		begin
			@current_step = @current_route.next
			@location = @current_step.origin
		rescue StopIteration
			@current_step = nil
			return false
		end
	end

	def next_step? #tells if there are more steps on this route
		begin
			@current_route.peek
		rescue StopIteration
			return false
		end
	end

	def self.find_by_driver(driver)
		found = nil
		ObjectSpace.each_object(Vehicle) {|v|
			found = v if v.driver == driver
		}
		found
	end

	def to_s
		ap "#{@driver} is driving this vehicle. Woooooo"
		ap @routes
	end
end