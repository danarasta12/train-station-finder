class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contacts_params)
    if @contact.save
      redirect_to root_path, notice: 'Votre message a bien été envoyé ! Nous revenons vers vous rapidement.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def contacts_params
    params.require(:contact).permit(:mail, :message)
  end
end
