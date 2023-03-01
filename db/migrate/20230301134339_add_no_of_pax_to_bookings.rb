class AddNoOfPaxToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :no_of_pax, :integer
  end
end
