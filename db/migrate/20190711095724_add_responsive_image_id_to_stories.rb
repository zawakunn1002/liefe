class AddResponsiveImageIdToStories < ActiveRecord::Migration[5.2]
  def change
    add_column :stories, :responsive_image_id, :string
  end
end
