class AddCoverImageIdToStories < ActiveRecord::Migration[5.2]
  def change
    add_column :stories, :cover_image_id, :string
  end
end
