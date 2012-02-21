class Vehicle < ActiveRecord::Base
	has_one :location
	has_many :drivers
	has_many :trips
end
