class Driver
	attr_accessor :wage
	attr_reader :fname, :lname, :id, :dob, :license_num
	def initialize(fname, lname, id, dob = nil, ln =nil)
		@fname = fname
		@lname = lname
		@id = id
		@license_num = ln
		if dob != nil
			@dob = dob
		end

	end
	def to_s
		@fname + " " + @lname
	end
end