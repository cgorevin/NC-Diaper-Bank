class AddDistanceToHotspots < ActiveRecord::Migration
  def change
    add_column :hotspots, :distance, :float
  end
end
