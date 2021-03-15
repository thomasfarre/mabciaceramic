class AdressesController < ApplicationController
  before_action :disable_nav, :disable_footer

  def edit
    if current_user.adress.empty?
      @adress = Adress.new
    else
      @adress = current_user.adress.first
    end
  end

  def update
    @adress = Adress.find(params[:id])
    if @adress.update(adress_params)
      redirect_to new_order_payment_path(@cart.order)
    else
      render :edit
    end
  end

  private

  def disable_nav
    @disable_nav = true
  end

  def disable_footer
    @disable_footer = true
  end

  def adress_params
    params.require(:adress).permit(:street, :street_detail, :zipcode, :country, :city, :name)
  end
end
