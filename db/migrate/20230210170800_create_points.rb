class CreatePoints < ActiveRecord::Migration[7.0]
  def change
    create_table :points do |t|
      t.belongs_to :member, null: false, foreign_key: true
      t.belongs_to :point_category, null: false, foreign_key: true
      t.boolean :is_approved

      t.timestamps
    end
  end
end
