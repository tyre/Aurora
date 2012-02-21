class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
    	t.integer "origin", :null => false
    	t.integer "destination", :null => false
    	t.integer "distance"
    	t.string "dist_str"
    	t.integer "time"
    	t.integer "time_str"
    	t.string "instructions"
      t.timestamps
    end
  end
end
