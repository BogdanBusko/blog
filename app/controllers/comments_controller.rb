class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comments_params)
    @comment.save
    redirect_to post_url(@post.id)
  end

  private

  def comments_params
    params.require(:comment).permit(:text, :user_id).merge(user_id: current_user.id)
  end
end
