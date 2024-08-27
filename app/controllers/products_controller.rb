class ProductsController < ApplicationController
  before_action :set_products, only: [ :show, :edit, :update, :destroy ]

  def index
    @products = Product.all
  end

  def show;end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new()

    if @product.save
      redirect_to @products, notice: "Produto criado com sucesso"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to @products, notice: "Produto atualizado com sucesso"
    end
  end

  def destroy
    @product.destroy
    redirect_to products_url, notice: "Produto removido com sucesso"
  end

  private

  def set_products
    @product = Product.find(params[:product_id])
  end

  def product_params
    params.require(:product).permit(:name, :description)
  end
end
