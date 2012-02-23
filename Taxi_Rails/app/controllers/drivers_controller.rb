class DriversController < ApplicationController
  def index
    @drivers = Driver.all
    render "index"
  end
end
