class AdressesController < ApplicationController
  before_action :disable_nav, :disable_footer

  def new
    @adress = Adress.new
  end

  def create
    @adress = Adress.new(adress_params)
    @adress.user = current_user

    if @adress.save
      if @cart.order.nil?
        redirect_to edit_user_registration_path(current_user)
      else
        redirect_to new_order_payment_path(@cart.order)
      end
    else
      render :new
    end
  end

  def edit
    @adress = current_user.adresses.first
  end

  def update
    @adress = Adress.find(params[:id])
    if @adress.update(adress_params)
      if @cart.order.nil?
        redirect_to edit_user_registration_path(current_user)
      else
        redirect_to new_order_payment_path(@cart.order)
      end
    else
      render :edit
    end
  end


  def destroy
    @adress = Adress.find(params[:id])
    if @adress.destroy
      redirect_to edit_user_registration_path
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
