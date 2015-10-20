class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.create(comment_params)
    @comment.update(user_id: current_user.id)
    !!@comment ? @post.comments << @comment : nil
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.delete
    redirect_to post_path(@post)
  end 

  def comment_params
    params.require(:post).require(:comment).permit(:content, :post_id )
  end

end