class Product < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  
  validates_presence_of :name, :price, :description

end
