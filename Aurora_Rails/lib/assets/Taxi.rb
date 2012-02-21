require_relative 'Vehicle.rb' #includes Location, Trip, Driver

class Taxi < Vehicle
	attr_reader :occupants, :seats
	def initialize(seats,location=Location.new(38.915924,-76.984061))
		super(location) #calls Vehicle.initialize
		@occupants = 0
		if seats.is_a? Integer
			@seats = seats
		else
			raise "Not really a legit value for seats..."
		end

	end

	def seats_free #how many free seats are there?
		seats - occupants
	end

	def pickup (dest, persons)
		if persons.is_a? Integer #make sure it's an int
			if @occupants + persons > @seats #make sure there are enough seats
				return false
			else
				@occupants += persons
				super(dest, persons)
				return true
			end
		else
			raise "Incorrect params. self.pickup(persons [INT], dest [LOCATION])"
		end
	end

	def dropoff()
		if @routes[0] != nil
			if @occupants - @routes[0].package.to_i >= 0
				finished_route = super() 	#knocks off first route, current location is its dest
				@occupants -= finished_route.package.to_i
			else
				raise "You can't dropoff if you ain't on a route, doggy."
			end	
		end
	end
end