class UsersController < ApplicationController


  before_action :authenticate_user!, only: [:index, :edit]


  def index
    #kaminariのページネーション
    @users = User.page(params[:page]).per(5)
    # 検索オブジェクト
    @search = @users.ransack(params[:q])
    # 検索結果
    @result = @search.result

    @users_result = @result.page(params[:page]).per(5)
    @user = current_user
    if current_user.admin_flag != 1
       redirect_to stories_path
    end

  end

  def show
  	@user =User.find(params[:id])
    #投稿小説を新しい順番に並び替えるため(.reverse_order)
    @stories = @user.stories.page(params[:stories_page]).reverse_order.per(3)
    #お気に入りした小説を新しい順番に並び替えるため。(.reverse_order)
    @favorites = @user.favorites.page(params[:favorites_page]).reverse_order.per(3)
  end

  def edit
    @user = User.find(params[:id])
    if current_user.id != @user.id
      redirect_to stories_path
    end
  end

  def update
     @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "プロフィール更新しました"
      redirect_to user_path(@user.id)
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path

  end

  def user_params
    params.require(:user).permit(:id, :email, :name, :url, :profile_image, story_attributes:[:title])
  end

  def search_params
      params.require(:q).permit!
  end

end
