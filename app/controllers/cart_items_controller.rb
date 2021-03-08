class CartItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart_item, only: :destroy
  before_action :set_cart, only: :create

  def new
    @cart_item = CartItem.new
  end

  def create
    item = Item.find(params[:item_id])
    @cart_item = @cart.add_item(item) unless item.sold?

    if @cart_item.nil?
      redirect_to item_path(item)
    else
      if @cart_item.save
        redirect_to @cart_item.cart
      else
        redirect_to item_path(item)
      end
    end
  end

  def destroy
    @cart = Cart.find(session[:cart_id])
    @cart_item.destroy
    redirect_to @cart
  end

  private

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end

  def cart_item_params
    params.require(:cart_item).permit(:item_id)
  end

end
