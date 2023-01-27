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
    
  end
end
