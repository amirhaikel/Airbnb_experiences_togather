class AddNumberOfPaxAndStatusToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :number_of_pax, :integer, null: false
    add_column :bookings, :status, :string, null: false
    add_column :bookings, :comment, :text
  end
end
