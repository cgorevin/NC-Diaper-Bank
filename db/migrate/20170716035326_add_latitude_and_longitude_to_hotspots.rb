class AddLatitudeAndLongitudeToHotspots < ActiveRecord::Migration
  def change
    add_column :hotspots, :latitude, :float
    add_column :hotspots, :longitude, :float
  end
end
