class DriversController < ApplicationController
  def index
    @drivers = Driver.all
    render "index"
  end

  def new
    @driver = Driver.new
    render "new"
  end

  def create
    @driver = Driver.new(params[:driver])
    if @driver.save
      redirect_to @driver
    else
      render "new"
    end
  end

  def show
    @driver = Driver.find(params[:id])
  end
end
