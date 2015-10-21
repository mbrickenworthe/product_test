class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.create(comment_params)
    redirect_to post_path(@post)
  end

  def destroy
    Comment.find(params[:id]).delete
    redirect_to post_path(params[:post_id])
  end 

  private

  def comment_params
    params.require(:post).require(:comment).permit(:content, :post_id, :user_id )
  end

end