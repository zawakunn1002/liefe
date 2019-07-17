class AddResponsiveCoverImageIdToStories < ActiveRecord::Migration[5.2]
  def change
    add_column :stories, :responsive_cover_image_id, :string
  end
end
