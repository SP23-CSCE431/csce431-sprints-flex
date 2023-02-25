class DropUserAndAddToAdmin < ActiveRecord::Migration[7.0]
  def change
    add_column :admins, :phone, :string
    add_column :admins, :role, :string
    drop_table :users
  end
end
