class AddLatAndLonToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :lat, :float
    add_column :restaurants, :lon, :float
  end
end
