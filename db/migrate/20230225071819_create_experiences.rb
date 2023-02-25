class CreateExperiences < ActiveRecord::Migration[7.0]
  def change
    create_table :experiences do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :description
      t.float :price

      t.timestamps
    end
  end
end
