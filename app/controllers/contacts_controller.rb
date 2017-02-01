class ContactsController < ApplicationController
  def create
    @contact = Contact.new(contact_params)
    respond_to do |format|
      if @contact.save
        ContactMailer.send_contact(@contact).deliver
        render json: { contact: contact_params, type: 'success', message: 'Contato enviado com sucesso!' }
        format.js
      else
        render json: { contact: contact_params, type: 'danger', message: 'Falha ao enviar contato...' }
        format.js
      end
    end
  end

  private
    def contact_params
      params.require(:contact).permit(:name, :email, :phone, :message) 
    end      
end
