class ContactsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.valid?
        ContactMailer.send_message(@contact).deliver_now
        format.html { redirect_to root_url, notice: t(:contact_message_sent) }
      else
        format.html { render :new }
      end
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
