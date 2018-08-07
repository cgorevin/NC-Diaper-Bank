class RemoveDistanceFromHotspots < ActiveRecord::Migration
  def change
    remove_column :hotspots, :distance, :float
  end
end
