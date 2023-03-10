class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.string :location
      t.date :date
      t.references :user, null: false, foreign_key: true
      t.references :cleaner, null: false, foreign_key: true

      t.timestamps
    end
  end
end
