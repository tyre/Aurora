class Driver
  attr_accessor :wage
  attr_reader :fname, :lname, :id, :dob, :license_num
  def initialize(fname = nil, lname = nil, id = nil, dob = nil, ln =nil)
    if fname.is_a? String
      @fname = fname
    else
      raise "First name (param 1) should be a String"
    end
    if lname.is_a? String
      @lname = lname
    else
      raise "Last name (param 2) should be a String"
    end
    if id.is_a? Integer
      @id = id
    else
      raise "id number (param 3) must be an Integer"
    end
    if dob != nil
      @dob = dob
    end
    @license_num = ln
  end
  def to_s
    @fname + " " + @lname
  end
end
