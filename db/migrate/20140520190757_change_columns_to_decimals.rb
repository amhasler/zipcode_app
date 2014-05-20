class ChangeColumnsToDecimals < ActiveRecord::Migration
  def change
  	change_column :zipcodes, :lat, :decimal
  	change_column :zipcodes, :lon, :decimal
  end
end
