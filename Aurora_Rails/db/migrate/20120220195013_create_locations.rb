class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
    	t.integer "location_id"
    	t.integer "lat", :null => false
    	t.integer "long", :null => false
      t.timestamps
    end
  end
end
