class ContactsFormController < ApplicationControllerSigned

	def create
    @contact_form = ContactForm.new(params[:contact_form])
	end
end
