class AddCapacityAndAvailableDatesToExperiences < ActiveRecord::Migration[7.0]
  def change
    add_column :experiences, :capacity, :integer, null: false
    add_column :experiences, :available_dates, :date
  end
end
