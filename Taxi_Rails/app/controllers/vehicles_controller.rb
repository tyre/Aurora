class VehiclesController < ApplicationController
  def index
    @vehicles = Vehicle.all
  end

  def new
    @vehicle = Vehicle.new
    @d_array = Driver.all.map { |d|
      [d.fname+' '+d.lname,d.id]  }

  end

  def show
    @vehicle = Vehicle.find(params[:id])
    begin
      @driver = Driver.find(@vehicle)
    rescue
      @driver = nil
    end
  end

  def create
    @vehicle = Vehicle.new(params[:vehicle])
    @vehicle.save
    flash[:message] = "Created vehicle with id #{@vehicle.id}!"
    redirect_to vehicle_path(@vehicle)
  end

  def edit
    @vehicle = Vehicle.find(params[:id])
  end

  def update
    @vehicle = Vehicle.find(params[:id])
    @vehicle.update_attributes(params[:vehicle])
    flash[:message] = "Vehicle #{@vehicle.id} updated!"
    redirect_to vehicle_path(@vehicle)
  end

end
