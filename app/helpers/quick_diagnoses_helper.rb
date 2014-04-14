module QuickDiagnosesHelper

	def educations
		{
				'Analfabeto             (0 años)'  => 0 ,
				'Estudios mínimos        (6 años)'  => 6 ,
				'Estudios Primarios      (10 años)' => 10 ,
				'Estudios Secundarios    (12 años)' => 12,
				'Estudios Universitarios (16 años)' => 16,
				'Otro (introducir número de años)'  => -1
		}
  end

  def correct(value)
    case value
      when nil
        'Null'
      when 0
        'No'
      when 1
        'Yes'
      when 2
        'Unknown'
      else
        'Error'
    end
  end
end
