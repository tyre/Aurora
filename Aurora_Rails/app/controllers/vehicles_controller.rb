require 'lib/assets/Vehicle'

class VehiclesController < ApplicationController
	def index
		@vehicles = Vehicle.all
	end

	def new
		@vehicle = Vehicle.new
	end

	def create
		@vehicle = Vehicle.new(params[:vehicle])
		@vehicle.save
		flash[:message] = "Vehicle successfully created"
		redirect_to vehicle_path(@vehicle)
	end

	def show
		@vehicle = Vehicle.find(params[:id])
	end

	def drive
		@vehicle = Vehicle.find(params[:format])

	end

end