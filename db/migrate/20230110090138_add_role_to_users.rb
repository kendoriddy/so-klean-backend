class AddRoleToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :role, :string
    change_column_default :users, :role, from: nil, to: "customer"
  end
end
