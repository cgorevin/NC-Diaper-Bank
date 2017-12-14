class ChangeZipsToStrings < ActiveRecord::Migration
  def up
    change_column :hotspots, :zip_code, :string
  end
  
  def down
    change_column :hotspots, :zip_code, :integer
  end
end
