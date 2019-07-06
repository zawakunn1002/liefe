class StoriesController < ApplicationController

	before_action :authenticate_user!, only: [:new,:edit]

	#kaminariにて一ページに何件表示するか決める
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
		#kaminariの書き方＋投稿を新しい順に並べるため
		@stories = Story.page(params[:page]).per(PER).order(:id).reverse_order
		# 検索オブジェクト
    	@search = @stories.ransack(params[:q])
    	# 検索結果
    	@result = @search.result

	end

	def show
		@story = Story.find(params[:id])
		@story_comment = StoryComment.new
		@contents = @story.short_story.each_char.each_slice(200).map(&:join)
		@user = current_user
	end

	def edit
		@story = Story.find(params[:id])

	end

	def update
		 @story = Story.find(params[:id])
		 @user = current_user

         if @story.update(story_params)
      		flash[:notice] = "小説を更新しました"
      		redirect_to user_path(@user.id)
    	 else
      		render 'edit'
    	 end

	end

	def destroy
		@stories = Story.find(params[:id])
        @stories.destroy
        @user = current_user
        redirect_to user_path(current_user.id)

	end

	private

  	def story_params
  	  	params.require(:story).permit(:title, :category, :short_story, :cover_image, :spine_cover_image, user_attributes:[:id,:name])
  	end

  	def search_params
  		params.require(:q).permit!
  	end

end
