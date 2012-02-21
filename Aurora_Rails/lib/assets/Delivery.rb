## Currently no different than the Vehicle class, but skeleton for future implementation.

require_relative 'Vehicle.rb'
class Delivery < Vehicle

	def initialize(location=Location.new(38.915924,-76.984061))
		super(location)
	end

	def pickup(dest, package)
		super(dest, package)
	end

	def dropoff
		super()
	end
end