class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
    	t.integer "vehicle_id", :null => false
    	t.integer "current_location"
      t.timestamps
    end
  end
end
