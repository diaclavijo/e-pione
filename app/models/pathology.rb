class Pathology < ActiveRecord::Base

  validates :pathology, presence: true
  validates :consultation_id, presence: true

  belongs_to :consultation
  has_one :physician, through: :consultation
  has_one :patient, through: :consultation


  PATHOLOGIES=       {
      'CARDIOPATIA NO ESPECIFICADA' => 0,
      'DEMENCIA VASCULAR' => 1,
      'DIABETES MELLITUS' => 2,
      'ENFERM. RENAL HIPERTENSIVA SIN ESPECIFICAR' => 3,
      'ENFERMEDAD DE PARKINSON' => 4,
      'ENFERMEDAD HEPATICA Y CIRROSIS CRONICA' => 5,
      'ENFERMEDAD VASCULAR PERIFERICA NO ESPECIFICADA' => 6,
      'ENFERMEDADES DIFUSAS DE LOS TEJIDOS CONECTIVOS' => 7,
      'GOTA' => 8,
      'HIPERCOLESTEROLEMIA PURA' => 9,
      'HIPERTENSION' => 10,
      'NEOPLASIA, BENIGNA' => 11,
      'NEOPLASIA, MALIGNA' => 12,
      'NEOPLASIA, SIN CERTEZA DE SI ES BENIGNA O MALIGNA' => 13,
      'OTROS TRASTORNOS DE LA TIROIDES' => 14,
      'PSICOSIS NO ESPECIFICADA' => 15,
      'TRASTORNO DEL RITMO CIRCADIANO DEL SUEÑO (VIGENTE 1/1/2008)' => 16,
      'TRASTORNOS EPISoDICOS DEL HUMOR' => 17 }

  CIE9=       {
      '429.9' => 0,
      '290.4' => 1,
      '250'  => 2,
      '403.9'  => 3,
      '332'  => 4,
      '571'  => 5,
      '443.9'  => 6,
      '710' =>  7,
      '274'  => 8,
      '272.0'  => 9,
      '997.91'  => 10,
      'M8000/0'  => 11,
      'M8000/3'  => 12,
      'M8000/1'  => 13,
      '246'  => 14,
      '298.9'  => 15,
      '327.3'  => 16,
      '296'   => 17}



  def pathology_text
    PATHOLOGIES.key self.pathology
  end

  def cie
    CIE9.key self.pathology
  end
end
