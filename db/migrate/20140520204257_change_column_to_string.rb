class ChangeColumnToString < ActiveRecord::Migration
  def change
  	change_column :zipcodes, :zip, :string
  end
end