class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.all
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  def new
    @new_post = Post.new
  end

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      format.html do
        if @post.save
          redirect_to user_posts_url
        else
          redirect_to new_user_post_path(current_user)
        end
      end
    end
  end

  def post_params
    params.require(:post).permit(:title, :text).merge(author: current_user, comments_counter: 0, likes_counter: 0)
  end
end
