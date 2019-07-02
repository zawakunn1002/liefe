class AddFavoritesCountToStories < ActiveRecord::Migration[5.2]
  def change
    add_column :stories, :favorites_count, :integer
  end
end
