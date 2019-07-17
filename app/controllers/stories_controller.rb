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
    	# お気に入り小説
    	@all_ranks = Story.find(Favorite.group(:story_id).order('count(story_id) desc').limit(3).pluck(:story_id))

	end

	def show
		@story = Story.find(params[:id])
		@story_comment = StoryComment.new
		#25文字ずつで区切り、11行埋めたら次のページを生成
		@contents = @story.short_story.scan(/.{1,25}/).each_slice(11).map(&:join)
		#@contents = @story.short_story.each_char.each_slice(210).map(&:join)
		@user = current_user
	end

	def edit
		@story = Story.find(params[:id])
		if current_user.id != @story.user.id
		   redirect_to stories_path
		end

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
