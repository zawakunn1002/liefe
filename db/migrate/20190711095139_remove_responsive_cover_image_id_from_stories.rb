class RemoveResponsiveCoverImageIdFromStories < ActiveRecord::Migration[5.2]
  def change
    remove_column :stories, :responsive_cover_image_id, :string
  end
end
