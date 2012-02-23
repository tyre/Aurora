class VehiclesController < ApplicationController
def index
  @vehicles = Vehicle.all
end

def new
  @vehicle = Vehicle.new
end

def show
  @vehicle = Vehicle.find(params[:id])
end

def create
  @vehicle = Vehicle.new(params[:vehicle])
  @vehicle.save
  flash[:message] = "Created vehicle with id #{@vehicle.id}!"
  redirect_to vehicle_path(@vehicle)
end

end
