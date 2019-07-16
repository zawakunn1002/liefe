class UsersController < ApplicationController

  #1ページあたりに表示する小説の数指定
  PER = 3

  before_action :authenticate_user!, only: [:index, :edit]


  def index
    #kaminariのページネーション
    @users = User.page(params[:page]).per(PER)
    @user = current_user
    if current_user.admin_flag != 1
       redirect_to stories_path
    end

  end

  def show
  	@user =User.find(params[:id])
    #投稿小説を新しい順番に並び替えるため(.order(:id).reverse_order)
    @stories = @user.stories.page(params[:page]).reverse_order.per(3)
    #お気に入りした小説を新しい順番に並び替えるため。(.order(:id).reverse_order)
    @favorites = @user.favorites.page(params[:page]).reverse_order.per(3)
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
    params.require(:user).permit(:id, :email, :name, :profile_image, story_attributes:[:title])
  end
end
