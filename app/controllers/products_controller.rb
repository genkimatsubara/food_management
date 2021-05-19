class ProductsController < ApplicationController
  before_action :authenticate_user, {only:[:new, :create, :edit, :update, :destroy]}
  #ログインしているのかを確かめる
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  
  def index
    @products = current_user.products.all
  end

  def new
    @product = Product.new
  end
  
  def create
    @product = current_user.products.new(product_params)
    if @product.save
      flash[:success] = "「#{@product.name}」を登録しました。"
      redirect_to products_path
    else
      render :new
    end
  end
  
  
  def show
  end

  def edit
  end
  
  def update
    if @product.update(product_params)
      flash[:success] = "#{@product.name}を更新しました。"
      redirect_to products_path
    else
      render :edit
    end
  end
  
  def destroy
    @product.destroy!
    redirect_to products_path
  end
  private
  
  def product_params
    params.require(:product).permit(:name, :deadline)
  end
  
  
  def set_product
    @product = current_user.products.find(params[:id])
  end

end
