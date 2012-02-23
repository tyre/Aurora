class VehicleReferencesDriver < ActiveRecord::Migration
  def up
    change_table :vehicles do |t|
      t.references :driver
    end
  end

  def down
  end
end
