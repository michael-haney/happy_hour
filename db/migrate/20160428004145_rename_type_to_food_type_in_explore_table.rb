class RenameTypeToFoodTypeInExploreTable < ActiveRecord::Migration
  def change
    rename_column :explores, :type, :food_type
  end
end
