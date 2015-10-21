class ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      @post = Post.create_from_last_product(current_user.name)
      @product.update(post_id: @post.id)
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
    if @product.update(product_params)
      redirect_to edit_post_path(@product.post_id)
    elsif product_params[:name].empty? || product_params[:price].empty? || product_params[:desciption].empty?
      redirect_to edit_product_path(@product), :notice => "Nothing can be blank."
    else
      render :edit
    end
  end

  def product_params
    params.require(:product).permit(:name, :price, :description, :user_id)
  end


end
