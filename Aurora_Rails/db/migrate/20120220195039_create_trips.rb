class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
    	t.integer "origin", :null => false #foreign key to Location
    	t.integer "destination", :null => false
    	t.integer "total_distance"
    	t.integer "total_time"
    	t.string "package"
    	t.string "type"
    	t.integer "vehicle_id"
      t.timestamps
    end
  end
end
