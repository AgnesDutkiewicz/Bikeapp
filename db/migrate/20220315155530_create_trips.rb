class CreateTrips < ActiveRecord::Migration[6.1]
  def change
    create_table :trips do |t|
      t.string :start_address
      t.string :destination_address
      t.decimal :distance, precision: 10, scale: 2
      t.decimal :price, precision: 10, scale: 2
      t.datetime :date

      t.timestamps
    end
  end
end
