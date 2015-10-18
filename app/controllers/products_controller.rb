class ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def create
    product = Product.new(product_params)
    if product.save
      product.update(user_id: current_user.id)
      @post = Post.create(title: "#{current_user.name}'s Invention Idea: #{product.name}", article: "#{product.description}")
      redirect_to edit_post_path(@post)
    elsif
      product_params[:name].empty? || product_params[:price].empty? || product_params[:description].empty?
      render :new, :notice => "Please fill in all the fields."
    else
      render :new
    end
  end

  def product_params
    params.require(:product).permit(:name, :price, :description)
  end


end
