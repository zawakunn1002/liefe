class RemoveResponsiveImageIdFromStories < ActiveRecord::Migration[5.2]
  def change
    remove_column :stories, :responsive_image_id, :string
  end
end
