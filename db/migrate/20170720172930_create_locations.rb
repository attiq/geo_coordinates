class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :address, limit: 256
      t.float :latitude
      t.float :longitude
      t.timestamps null: false
    end
    add_index :locations, :address
  end
end
