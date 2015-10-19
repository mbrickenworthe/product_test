class ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    product = Product.new(product_params)
    product
    if product.save
      product.update(user_id: current_user.id)
      @post = Post.create(title: "#{current_user.name}'s Invention Idea: #{product.name}", article: "#{product.description}", user_id: current_user.id, product_id: product.id)
      product.post_id = @post.id
      product.save
      redirect_to edit_post_path(@post)
    elsif
      product_params[:name].empty? || product_params[:price].empty? || product_params[:description].empty?
      render :new, :notice => "Please fill in all the fields."
    else
      render :new
    end
  end

  def update
    @product = Product.find(params[:id])
    @post = Post.where(product_id: @product.id).first
    if @product.update(product_params)
      redirect_to post_path(@post)
    elsif product_params[:name].empty? || product_params[:price].empty? || product_params[:desciption].empty?
      redirect_to edit_product_path(@product), :notice => "Nothing can be blank."
    else
      render :edit
    end
  end

  def product_params
    params.require(:product).permit(:name, :price, :description)
  end


end
