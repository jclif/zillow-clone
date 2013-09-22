class CreateListings < ActiveRecord::Migration
  def self.up
    create_table :listings do |t|
      t.integer :user_id, null: false
      t.string :res_type
      t.integer :price, null: false
      t.integer :bedrooms
      t.integer :bathrooms
      t.integer :home_sqr_foot
      t.integer :lot_sqr_foot
      t.integer :year_built
      t.string :parking_type
      t.string :cooling_type
      t.text :description
      t.timestamps
    end

    add_index :listings, :user_id
  end

  def self.down
    drop_table :listings
  end
end
