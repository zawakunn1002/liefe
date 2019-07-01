class CreateStories < ActiveRecord::Migration[5.2]
  def change
    create_table :stories do |t|
      t.text :short_story
      t.string :title
      t.integer :user_id

      t.timestamps
    end
  end
end
