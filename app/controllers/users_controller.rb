class UsersController < ApplicationController

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @user = current_user.name
    @posts = current_user.posts
    @blogs = current_user.blogs
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
