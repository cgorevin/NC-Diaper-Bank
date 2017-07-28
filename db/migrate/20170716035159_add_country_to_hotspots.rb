class AddCountryToHotspots < ActiveRecord::Migration
  def change
    add_column :hotspots, :country, :string
  end
end
