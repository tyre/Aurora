class DriversController < ApplicationController
  def index
    @drivers = Driver.all
  end

  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.new(params[:driver])
    @driver.save
    flash[:message] = "Successfully created Driver #{@driver.id}!"
    redirect_to driver_path(@driver)
  end

  def show
    @driver = Driver.find(params[:id])
  end

  def destroy
    @driver = Driver.find(params[:id])
    @driver.destroy
    flash[:message] = "Driver #{@driver.id} successfully destroyed."
    redirect_to drivers_path
  end
end
