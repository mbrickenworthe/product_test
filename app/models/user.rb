class User < ActiveRecord::Base
  has_many :products
  has_many :posts, through: :products
  has_many :comments
  has_many :votings

  validates_presence_of :name, presence: true

  validates_uniqueness_of :email
  validates_presence_of :email, presence: true

  has_secure_password
end
