class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  has_many :votings
  has_many :comments, :dependent => :destroy
  validates_presence_of :title, :article

  def self.create_from_last_product(user_name)
    @product = Product.last
    self.create(title: "#{user_name}'s Invention Idea: #{@product.name}", article: "#{@product.description}", user_id: @product.user_id, product_id: @product.id)
  end 

  def increment_rating
    self.update(rating: (self.rating +=1))
  end

  def decrease_rating
    self.update(rating: (self.rating -=1))
  end

  def destroy_post_product_and_comments
    self.comments.delete_all
    self.product.delete
    self.delete
  end

end
