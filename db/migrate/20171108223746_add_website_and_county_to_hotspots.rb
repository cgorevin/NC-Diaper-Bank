class AddWebsiteAndCountyToHotspots < ActiveRecord::Migration
  def change
    add_column :hotspots, :website, :string
    add_column :hotspots, :county, :string
  end
end
