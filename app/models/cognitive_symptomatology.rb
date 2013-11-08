class CognitiveSymptomatology < ActiveRecord::Base
  belongs_to :Consultation


  validates :memory, :disorientation, :aphasia, :apraxia, :agnosia, :executive, :reasoning, :spatial, presence: true

  COGNITIVESYMPTOMATOLOGY = { 'No explorado' => 0, 'Desconocido' => 1, 'Sí' => 2, 'No' => 3}




  def read_attribute(attr_name)
    not_filtered_names = ['Consultation_id', 'id']

    return COGNITIVESYMPTOMATOLOGY.key super(attr_name) unless not_filtered_names.include? attr_name

    super(attr_name)

  end

end
