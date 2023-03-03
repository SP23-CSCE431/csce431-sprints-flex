class AddBackPhoneAndRoleToAdmins < ActiveRecord::Migration[7.0]
  def change
    add_column :admins, :phone, :string
    add_column :admins, :role, :string
  end
end
