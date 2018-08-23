class AddDefaultValueToStateAttribute < ActiveRecord::Migration
  def up
    change_column :hotspots, :state, :string, default: 'North Carolina'
  end

  def down
    change_column :hotspots, :state, :string, default: nil
  end
end
