class AddDefaultValueToCountryAttribute < ActiveRecord::Migration
  def up
    change_column :hotspots, :country, :string, default: 'US'
  end

  def down
    change_column :hotspots, :country, :string, default: nil
  end
end
