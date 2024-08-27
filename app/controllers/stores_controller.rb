class StoresController < ApplicationController
  before_action :set_stores, only: [ :show, :edit, :update, :destroy ]

  def index
    @stores = Store.all
  end

  def show;end

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)

    if @store.save
      redirect_to @stores, notice: "Loja criada com sucesso"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @store.update(product_params)
      redirect_to @stores, notice: "Loja atualizado com sucesso"
    end
  end

  def destroy
    @store.destroy
    redirect_to stores_url, notice: "Loja removido com sucesso"
  end

  private

  def set_stores
    @store = Store.find(params[:store_id])
  end

  def store_params
    params.require(:store).permit(:name, :description, :latitude, :longitude)
  end
end
