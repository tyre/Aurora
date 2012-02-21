class Trip < ActiveRecord::Base
	belongs_to :driver
	has_many :steps
end
