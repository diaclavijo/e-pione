module Siad
	extend ActiveSupport::Concern

	included do
		private
			# This function is critical. Therefore keyword args are used

			def siad (faq_score: nil, mmse: nil, age: nil, education: nil )
				python_script = 'python3.3 /opt/binnac/SIAD/SIAD_deployed.py'
				return nil unless faq_score && mmse && age && education # all the args are mandatory

				result = `#{python_script} age:#{age} educ:#{education} faq:#{faq_score} mmse:#{mmse}`
				output_reg = /(\d)\s+(\d+\.\d+)/
				if output_reg.match result
					diagnosis = $1.to_i
					probability = $2.to_f
					[ diagnosis, probability ]
				else
					nil
				end
			end
	end
end