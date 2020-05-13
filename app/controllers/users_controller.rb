class UsersController < ApplicationController

  def show
    @user = current_user.name
    @posts = current_user.posts
  end
end
