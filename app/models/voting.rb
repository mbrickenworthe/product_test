class Voting < ActiveRecord::Base
  validates :user_id, presence: true
  validates :post_id, presence: true
  belongs_to :user
  belongs_to :post

  attr_reader :post, :user

  def self.user_has_voting_record?
    !!Voting.where(params).first
  end

  def self.current_vote
    Voting.where(params).first.voting_record
  end

  def self.upvoting_record
    Voting.find_or_create_by(params).update(voting_record: true)
    @post.increment_rating
  end

  def self.downvoting_record
    Voting.find_or_create_by(params).update(voting_record: false)
    @post.decrease_rating
  end

  def self.upvote_post(post:, user:)
    @post = post
    @user = user
    if !user_has_voting_record? 
      upvoting_record
    elsif user_has_voting_record? && !current_vote
      upvoting_record
    else
    end
  end

   def self.downvote_post(post:, user:)
    @post = post
    @user = user
    if !user_has_voting_record? 
      downvoting_record
    elsif user_has_voting_record? && current_vote
      downvoting_record
    else
    end
  end

  private

  def self.params
    params = {user_id: @user.id, post_id: @post.id}
  end

end
