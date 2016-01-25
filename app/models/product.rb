class Product < ActiveRecord::Base
  belongs_to :user
  has_many :posts
  
  validates_presence_of :name, :price, :description

end
