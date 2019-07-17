class FavoritesController < ApplicationController

	def create
		@story = Story.find(params[:story_id])
		@favorite = current_user.favorites.build(story_id: params[:story_id])
    	@favorite.save

	end

	def destroy
		@story = Story.find(params[:story_id])
		@favorite = Favorite.find_by(story_id: @story, user_id: current_user.id)
    	@favorite.destroy

	end

end
