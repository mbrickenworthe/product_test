class PostsController < ApplicationController

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @comment = Comment.new
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def upvote
   @post = Post.find(params[:id]) 
    if user_present?
      @post.upvote_by(current_user)
      redirect_to root_path
    else
      redirect_to root_path, :notice => "You need to be signed in to upvote!"
    end
  end

  def downvote
  @post = Post.find(params[:id]) 
    if user_present?
      @post.downvote_by(current_user)
      redirect_to root_path
    else
      redirect_to root_path, :notice => "You need to be signed in to downvote!"
    end
  end

  def update
    binding.pry
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to root_path, :notice => "Your new post has been added!"
    elsif post_params[:title].empty? || post_params[:article].empty?
      redirect_to edit_post_path(@post), :notice => "Nothing can be blank."
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy_post_product_and_comments
    redirect_to root_path
  end

  def post_params
    params.require(:post).permit(:title, :article)
  end

end
