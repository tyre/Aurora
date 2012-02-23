class Vehicle < ActiveRecord::Base
  has_many :trips
  has_one :driver
end
