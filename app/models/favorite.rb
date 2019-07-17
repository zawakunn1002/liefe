class Favorite < ApplicationRecord
	belongs_to :user
	belongs_to :story, counter_cache: :favorites_count
end
