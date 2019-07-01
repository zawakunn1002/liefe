class Story < ApplicationRecord
	belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :story_comments, dependent: :destroy

	validates :short_story, presence: true
	validates :title, presence: true, length: { maximum: 50 }

	def favorited_by?(user)
          favorites.where(user_id: user.id).exists?
    end
end
