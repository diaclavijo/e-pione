class ContactFormsController < ApplicationController

	def create
    @contact_form = ContactForm.new(params[:contact_form])
    @faild_send = false
    respond_to do |format|
      if @contact_form.valid?
        unless @contact_form.deliver
          logger.fatal('Failed to send email through contact form')
          @failed_send = true
        end
        flash[:notice] = 'Your work was awesome! A unicorn is born!'
        format.js { render :js => "window.location = #{root_path.to_json}" }

      else
        format.js { render 'contact_form' }
      end
    end
	end
end
