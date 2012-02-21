class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
    	t.string "fname", :null => false
      t.string "lname", :null => false
      t.integer "driver_id", :null => false
      t.string "license_number", :null =>false
      t.datetime "dob"
      t.timestamps
    end
  end
end
