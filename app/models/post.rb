class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  has_many :comments, :dependent => :destroy
  validates_presence_of :title, :article

end
