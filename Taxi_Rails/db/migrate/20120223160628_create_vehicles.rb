class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      #t.references :trip
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
