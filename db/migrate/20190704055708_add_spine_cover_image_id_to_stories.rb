class AddSpineCoverImageIdToStories < ActiveRecord::Migration[5.2]
  def change
    add_column :stories, :spine_cover_image_id, :string
  end
end
