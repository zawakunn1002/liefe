class UsersController < ApplicationController

  PER = 3


  def index
    @users = User.page(params[:page]).per(PER)
    @user = current_user
    if @user.admin_flag != 1
      redirect_to stories_path
    end

  end

  def show
  	@user =User.find(params[:id])
    @stories = Story.where(user_id: @user.id)
    @favorites = Favorite.where(user_id: @user.id).all
  end

  def edit
    @user = current_user
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
    redirect_to stories_path

  end

  def user_params
    params.require(:user).permit(:id, :name, :profile_image, story_attributes:[:title])
  end
end
