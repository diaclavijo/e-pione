class DiagnosesController < ApplicationControllerSigned
  before_action :set_diagnosis, only: [:show, :edit, :update, :destroy]

  # GET /diagnoses
  # GET /diagnoses.json
  def diagnosis
    testa = TestMinimental.first.score
    testb = Patient.first.id



    render inline: "hola #{testa} #{testb}  <br />" + %x(python pythonscript.py #{testa} #{testb} 2>&1)
  end
end
