class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
      t.integer :listing_id
      t.timestamps
    end

    add_index :locations, :listing_id
  end

  def self.down
    drop_table :locations
  end
end
