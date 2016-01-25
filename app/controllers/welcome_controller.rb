class WelcomeController < ApplicationController
  def index
    @posts = Post.all.order(rating: :desc)
  end
  
end
