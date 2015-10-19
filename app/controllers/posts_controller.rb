class PostsController < ApplicationController

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @comment = Comment.new
    @post = Post.find(params[:id])
  end

  def upvote
   @post = Post.find(params[:id]) 
    if user_present? && !(current_user.votings.where(post_id: @post.id).first)
      score = @post.rating + 1
      @post.update(rating: score)
      @vote = Voting.new(voting_record: true)
      @vote.user = current_user
      @vote.post = @post
      @vote.save
      redirect_to root_path
    elsif user_present? && !(current_user.votings.where(post_id: @post.id).first.voting_record)
      @vote = current_user.votings.where(post_id: @post.id).first
      @vote.update(voting_record: true)
      score = @post.rating + 1
      @post.update(rating: score)
      redirect_to root_path
    elsif
      current_user.votings.where(post_id: @post.id).first.voting_record
      redirect_to root_path
    else
      redirect_to root_path, :notice => "You need to be signed in to vote!"
    end
  end

  def downvote
  @post = Post.find(params[:id]) 
    if user_present? && !(current_user.votings.where(post_id: @post.id).first)
      score = @post.rating - 1
      @post.update(rating: score)
      @vote = Voting.new(voting_record: false)
      @vote.user = current_user
      @vote.post = @post
      @vote.save
      redirect_to root_path
    elsif user_present? && current_user.votings.where(post_id: @post.id).first.voting_record
      @vote = current_user.votings.where(post_id: @post.id).first
      @vote.update(voting_record: false)
      score = @post.rating - 1
      @post.update(rating: score)
      redirect_to root_path
    elsif
      current_user.votings.where(post_id: @post.id).first.voting_record
      redirect_to root_path
    else
      redirect_to root_path, :notice => "You need to be signed in to vote!"
    end
  end

  def add_a_comment
    @post = Post.find(comment_params[:comment][:post_id])
    if user_present? == false
      redirect_to post_path(@post), :notice => "You need to sign in to comment."
    elsif comment_params[:comment][:content].empty?
      redirect_to post_path(@post)
    elsif comment_params
      @comment = Comment.create(comment_params[:comment])
      @comment.user = current_user
      @comment.save
      @post.comments << @comment
      redirect_to post_path(@post)
    else
      redirect_to post_path(@post)
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to root_path, :notice => "Your new post has been added!"
    elsif post_params[:title].empty? || post_params[:article].empty?
      redirect_to edit_post_path(@post), :notice => "Nothing can be blank."
    else
      render :edit
    end
  end

  def comment_params
    params.require(:post).permit(comment: [ :content, :post_id ])
  end

  def post_params
    params.require(:post).permit(:title, :article)
  end

end
