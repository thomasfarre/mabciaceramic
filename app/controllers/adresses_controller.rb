class AdressesController < ApplicationController

  def edit
    if current_user.adresses.empty?
      @adress = Adress.new
    else
      @adress = Adress.find(params[:id])
    end


  end

  def update
    @adress = Adress.find(params[:id])
    if @adress.update(adress_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def adress_params
    params.require(:adress).permit(:street, :street_detail, :zipcode, :country, :phone)
  end
end
