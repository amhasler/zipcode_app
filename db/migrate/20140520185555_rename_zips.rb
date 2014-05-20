class RenameZips < ActiveRecord::Migration
  def change
  	rename_table :zips, :zipcodes
  end
end
