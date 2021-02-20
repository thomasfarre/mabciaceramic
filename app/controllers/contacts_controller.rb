class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.deliver
      redirect_to root_path
    else
      render :create
    end
  end

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end