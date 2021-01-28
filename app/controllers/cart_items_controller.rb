class CartItemsController < ApplicationController
  include CurrentCart
  skip_before_action :verify_authenticity_token
  before_action :set_cart_item, only: [:show, :edit, :update, :destroy]
  before_action :set_cart, only: [:create]

  def index
    @cart_items = CartItem.all
  end

  def show
  end

  def new
    @cart_item = CartItem.new
  end

  def edit
  end

  def create
    item = Item.find(params[:item_id])
    @cart_item = @cart.add_item(item)

    if @cart_item.save
      redirect_to @cart_item.cart, notice: 'Objet à été ajouté au panier'
    else
      render :new
    end
  end

  private

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end

  def cart_item_params
    params.require(:cart_item).permit(:item_id)
  end

end
