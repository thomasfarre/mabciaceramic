class CartsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart
  before_action :set_cart, only: [:show, :edit, :update, :destroy]
  # before_action :disable_footer, only: [:show]

  def index
    @carts = Cart.all
  end

  def show
    @cart = Cart.find(params[:id])
  end

  def new
    @cart = Cart.new
  end

  def edit
  end

  def create
    @cart = Cart.new(cart_params)

    if @cart.save
      redirect_to @cart, 'Panier crée avec succès'
    else
      render :new
    end
  end

  def destroy
    if !current_user.nil?
      @cart.destroy
    else
      @cart.destroy if @cart.id == session[:cart_id]
      session[:cart_id] = nil
    end
    redirect_to root_path, notice: 'Le panier à été détruit'
  end

  private

  def set_cart
    @cart = Cart.find(params[:id])
  end

  def disable_footer
    @disable_footer = true
  end

  def cart_params
    params.require(:cart).permit(:user_id)
  end

  def invalid_cart
    logger.error "Attempt to acces invalid cart #{params[:id]}"
    redirect_to root_path, notice: "Ce panier n'existe pas"
  end
end
