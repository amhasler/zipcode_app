class CreateZips < ActiveRecord::Migration
  def change
    create_table :zips do |t|
      t.integer :zip
      t.integer :lat
      t.integer :lon
      t.integer :city_id

      t.timestamps
    end
  end
end
