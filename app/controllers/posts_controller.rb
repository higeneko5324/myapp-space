class PostsController < ApplicationController
  # before_action :post_group_by
  def index
    @posts = Post.all.includes(:user, :event)
    @posts = Post.all.order(id: :DESC)

  end

  def new
    @posts = Post.all.order(id: :DESC)
    @post = Post.new
    @posts = Post.includes(:user)
    @events = Event.includes(:event)
    @event = Event.new
    
    
    
  end

  def create

    @post = Post.create(post_params)
    # logger.debug @post.errors.inspect
      if @post.save
          respond_to do |format|
          # format.html { redirect_to new_post_path}
          format.json 
        end
      end
    @event = Event.create
        if @event.save
            respond_to do |format|
            format.json
          end
        end
  end

  def show
    @post = Post.find(params[:id]) 
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
    
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to new_post_path
  end


  private
  def post_params
    params.require(:post).permit(:text, :content, ).merge(user_id: current_user.id)
  end

  

  # def post_group_by
  #   @posts = Post.order('created_at DESC').group_by{|post| post.created_at.to_date.strftime('%Y/%m/%d')}
  #   gon.posts_group_by = @posts
  #   @users = User.all
  #   gon.users = []
  #   @users.each do |users|
  #     gon.users << users
  #   end
  # end

end



