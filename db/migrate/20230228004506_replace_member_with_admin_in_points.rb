class ReplaceMemberWithAdminInPoints < ActiveRecord::Migration[7.0]
  def change
    remove_index :points, :member_id
    add_reference :points, :admin, index: true, foreign_key: true
  end
end
