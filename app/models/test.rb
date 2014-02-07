#this is the index of tests. Common information about every test is stored here to be able to show all the tests for a consultation or a patient

class Test < ActiveRecord::Base

  # paginates_per 5
  belongs_to :consultation
  belongs_to :test_data, polymorphic: true
  has_one :patient, through: :consultation
  has_one :physician, through: :consultation

  CATEGORIES = { 'Sintomatología Cognitiva' => 0,
                 'Sintomatología No-Cognitiva' => 1,
                 'Exploración Funcional' => 2,
                 'Exploración Neurológica' => 3,
                 'Exploración Física' => 4
              }


  SUCCESS = { 'Error' => 0, 'Acierto' => 1}

  YESNO = { 'Sí'         => 1,
            'No'     => 0 }


  def category_text
    CATEGORIES.key self.category
  end

end
