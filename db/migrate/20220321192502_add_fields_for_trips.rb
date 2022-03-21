class AddFieldsForTrips < ActiveRecord::Migration[6.1]
  def change
    add_column :trips, :latitude, :decimal
    add_column :trips, :longitude, :decimal
  end
end
