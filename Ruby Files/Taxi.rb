require_relative 'Vehicle.rb' #includes Location, Trip, Driver

class Taxi < Vehicle
  attr_reader :occupants, :seats
  def initialize(seats,location=Location.new(38.915924,-76.984061))
    super(location) #calls Vehicle.initialize
    @occupants = 0
    @seats = seats
  end

  def seats_free #how many free seats are there?
    seats - occupants
  end

  def pickup (dest, persons)
    if @occupants + persons > @seats #make sure there are enough seats
      return false
    else
      @occupants += persons
      super(dest, persons)
      return true
    end
  end

  def dropoff()
    if @routes[0] != nil
      if @occupants - @routes[0].package.to_i >= 0
        finished_route = super()  #knocks off first route, current location is its dest
        @occupants -= finished_route.package.to_i
      end
    end
  end
end