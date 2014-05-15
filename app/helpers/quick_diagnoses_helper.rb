module QuickDiagnosesHelper



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
