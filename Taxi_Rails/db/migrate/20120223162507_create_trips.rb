class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.references :vehicle
      t.float :origin_latitude
      t.float :origin_longitude
      t.float :destination_latitude
      t.float :destination_longitude
      t.float :distance
      t.timestamps
    end
  end
end
