class ContactMailer < ActionMailer::Base
	def send_contact(contact)
		@contact = contact
		mail(
			to: 'paulo.oliveira278@gmail.com', 
			from: contact.email,
			subject: 'Contato'
		)
	end 
end