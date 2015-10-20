class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  has_many :votings
  has_many :comments, :dependent => :destroy
  validates_presence_of :title, :article

  def upvote_by(user)
    self.votings.find_or_create_by(user_id: user.id).update(voting_record: true)
    self.update(rating: (self.rating +=1))
  end

   def downvote_by(user)
    self.votings.find_or_create_by(user_id: user.id).update(voting_record: false)
    self.update(rating: (self.rating -=1))
  end

  def destroy_post_product_and_comments
    self.product.delete
    self.comments.delete
    self.delete
  end

end
