class AddFieldsToBudgetRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :budget_requests, :requester_name, :string
    add_column :budget_requests, :phone, :string
    add_column :budget_requests, :mailing_address, :string
    add_column :budget_requests, :mail_option, :string
    add_column :budget_requests, :tamu_affiliation, :string
    add_column :budget_requests, :uin, :string
  end
end
