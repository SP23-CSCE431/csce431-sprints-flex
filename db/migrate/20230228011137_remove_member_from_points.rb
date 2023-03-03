class RemoveMemberFromPoints < ActiveRecord::Migration[7.0]
  def change
    remove_column :points, :member_id
  end
end
