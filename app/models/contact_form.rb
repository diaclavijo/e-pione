class ContactForm < MailForm::Base
  include MailForm::Delivery

	attribute :name,      :validate => true
	attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
	attribute :message

	# Declare the e-mail headers. It accepts anything the mail method
	# in ActionMailer accepts.
	def headers
		{
				:subject => "E-PIONE: Solicitud de prueba",
				:to => "david@diazclavijo.com",
				:from => %("#{name}" <#{email}>)
		}
	end
end
