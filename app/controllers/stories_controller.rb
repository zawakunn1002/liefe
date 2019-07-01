class StoriesController < ApplicationController

	PER = 3

	def new
		@story = Story.new

	end

	def create
		@story = Story.new(story_params)
		@story.user_id = current_user.id
		@user = current_user
		if @story.save
		   flash[:notice] = "小説を新規投稿しました"
		   redirect_to user_path(current_user.id)
		else
		   render "new"
		end

	end


	def index
		@stories = Story.page(params[:page]).per(PER)
		# 検索オブジェクト
    	@search = @stories.ransack(params[:q])
    	# 検索結果
    	@result = @search.result
    	#binding.pry

	end

	def show

	end

	def edit

	end

	def update

	end

	def destroy
		@stories = Story.find(params[:id])
        @stories.destroy
        @user = current_user
        redirect_to user_path(current_user.id)

	end

	private

  	def story_params
  	  	params.require(:story).permit(:title, :category, :short_story, user_attributes:[:id,:name])
  	end

  	def search_params
  		params.require(:q).permit!
  	end

end
