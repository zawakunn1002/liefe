class Story < ApplicationRecord
	belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :story_comments, dependent: :destroy

	validates :short_story, presence: true, length: { maximum: 1290 }
	validates :title, presence: true, length: { maximum: 50 }
	validates :category, presence: true

	attachment :cover_image
	attachment :spine_cover_image

	def favorited_by?(user)
          favorites.where(user_id: user.id).exists?
    end
end
