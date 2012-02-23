class Vehicle < ActiveRecord::Base
  belongs_to :driver
  has_many :trips
end
