class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.deliver
      flash[:success] = "Votre message à bien été envoyé !"
      redirect_to root_path
    else
      flash[:error] = "Une erreur c'est produite, veuillez réessayer !"
      render :new
    end
  end

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
