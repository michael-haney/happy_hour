class CreateExplores < ActiveRecord::Migration
  def change
    create_table :explores do |t|
      t.string :restaurant_name
      t.float :latitude
      t.float :longitude
      t.string :type
      t.string :deals
      t.string :hours
      t.string :location
      t.string :address

      t.timestamps null: false
    end
  end
end
