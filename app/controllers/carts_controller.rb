class CartsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart
  before_action :set_cart, only: [:show, :destroy]

  def show
  end

  def new
    @cart = Cart.new
  end

  def destroy
    if !current_user.nil?
      @cart.destroy
    else
      @cart.destroy if @cart.id == session[:cart_id]
      session[:cart_id] = nil
    end
    redirect_to root_path
  end

  private

  def set_cart
    @cart = Cart.friendly.find(params[:id])
  end

  def cart_params
    params.require(:cart).permit(:user_id)
  end

  def invalid_cart
    logger.error "Attempt to acces invalid cart #{params[:id]}"
    redirect_to root_path, notice: "Ce panier n'existe pas"
  end
end
