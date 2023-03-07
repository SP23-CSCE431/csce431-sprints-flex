class AddDateToPoints < ActiveRecord::Migration[7.0]
  def change
    add_column :points, :date_attended, :date
  end
end
