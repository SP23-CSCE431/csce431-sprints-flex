class AddDescriptionToPoints < ActiveRecord::Migration[7.0]
  def change
    add_column :points, :description, :string
  end
end
