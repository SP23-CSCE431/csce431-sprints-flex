class AddPhotoToPoints < ActiveRecord::Migration[7.0]
  def change
    add_column :points, :photo, :string
  end
end
