class AdressesController < ApplicationController

  def edit
    if current_user.adresses.empty?
      @adress = Adress.new
    else
      @adress = current_user.adresses.first
    end
  end

  def create
    @adress = Adress.new(adress_params)
    @adress.user = current_user
    if @adress.save
      redirect_to new_order_payment_path(@cart.order)
    else
      render :edit
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

  def adress_params
    params.require(:adress).permit(:street, :street_detail, :zipcode, :country, :phone, :city)
  end
end
