class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :restaurant_name
      t.string :menu_item
      t.string :price
      t.string :hours
      t.string :location

      t.timestamps null: false
    end
  end
end
