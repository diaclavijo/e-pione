class ContactForm < MailForm::Base
	attribute :name,      :validate => true
	attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :institution
	attribute :message

	# Declare the e-mail headers. It accepts anything the mail method
	# in ActionMailer accepts.
	def headers
		{
				:subject => "E-PIONE: Solicitud de prueba",
				:to => "support@e-pione.com",
				:from => %("#{name}" <#{email}>)
		}
	end
end
