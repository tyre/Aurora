class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.string :fname
      t.string :lname
      t.string :license_num
      t.date   :dob
      t.timestamps
    end
  end
end
