class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
    respond_to do |format|
      format.html { render :new, locals: { comment: @comment } }
    end
  end

  def create
    post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)

    respond_to do |format|
      format.html do
        if @comment.save
          redirect_to user_post_path(current_user.id, @comment.post)
        else
          redirect_to new_post_comment_path(current_user.id, post.id)
        end
      end
    end
  end
  def destroy
    user = User.find(params[:user_id])
    post = user.posts.find(params[:post_id])
    comment = Comment.find(params[:id])
    if comment.destroy
      flash[:success] = 'Post was successfully deleted.'
    else
      flash[:error] = 'Error: Post could not be deleted'
    end
    redirect_to user_post_path
  end
  def comment_params
    params.require(:comment).permit(:text).merge(author: current_user, post_id: params.require(:post_id))
  end
end
