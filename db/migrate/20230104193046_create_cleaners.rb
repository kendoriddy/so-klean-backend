class CreateCleaners < ActiveRecord::Migration[7.0]
  def change
    create_table :cleaners do |t|
      t.string :name
      t.string :location
      t.float :charges
      t.string :photo

      t.timestamps
    end
  end
end
