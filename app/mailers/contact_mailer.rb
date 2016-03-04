class ContactMailer < ApplicationMailer
  default to: 'info@umed.be'

  def send_message(contact)
    mail(from: contact.email,
         content_type: "text/html",
         body: contact.message,
         subject: I18n.t('.subject', scope: [:contact_mailer]))
  end
end
