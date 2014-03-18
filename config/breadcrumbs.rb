crumb :root do
  link 'Inicio', root_path
end

crumb :patients do
  link 'Búsqueda de pacientes', patients_path
end

crumb :contact do
  link 'Contactar', new_contacts_path
end
crumb :quick_diagnosis do
  link 'Diagnóstico Rápido', new_quick_diagnosis_path
end
crumb :new_patient do
  link 'Registrar nuevo paciente', new_patient_path
  parent :patients
end

crumb :edit_patient do |patient|
  link 'Editar paciente '+patient.full_name, edit_patient_path(patient)
  parent :patients
end

crumb :patient do |patient|
  link patient.full_name, patient_consultations_path(patient)
  parent :patients
end

crumb :patient_full_history do |patient|
  link 'Historia completa del paciente', patient_full_history_path(patient)
  parent :patient, patient
end

crumb :new_patient_consultation do |patient|
  link 'Nueva consulta'
  parent :patient, patient
end

crumb :patient_consultation do |patient, consultation|
  link ('Consulta '+consultation.date.to_s), patient_consultation_path(patient, consultation)
  parent :patient, patient
end




# This finds all the tests defined in the folder tests, and from that it infers the breadcrumbs for all of them
tests = Pathname.glob('app/models/tests/*').map{ |i| i.basename.to_s.gsub('.rb','') }

tests.each{|test_key|

  crumb :"new_consultation_#{test_key}" do |consultation|
    link 'Nuevo '+test_key.classify.constantize::NAME, send("new_consultation_#{test_key}_path", consultation)
    parent :patient_consultation, consultation.patient, consultation
  end

  crumb :"consultation_#{test_key}" do |consultation, test_var|
    link test_key, send("consultation_#{test_key}_path", consultation, test_var)
    parent :patient_consultation, consultation.patient, consultation
  end
}

tests.each{|test_key|

	crumb :"new_quick_#{test_key}" do |consultation|
		link 'Nuevo '+test_key.classify.constantize::NAME
		parent :quick_diagnosis
	end
}

crumb :new_consultation_test_reloj do |consultation|
  link 'Nuevo Test del reloj', new_consultation_test_reloj_path(consultation)
  parent :consultation_additional_tests, consultation
end

crumb :consultation_test_reloj do |consultation, test_var|
  link 'Test del reloj', consultation_test_reloj_path(consultation, test_var)
  parent :consultation_additional_tests, consultation
end

crumb :consultation_additional_tests do |consultation|
  link 'Test adicionales', consultation_additional_tests_path(consultation)
  parent :patient_consultation, consultation.patient, consultation
end

crumb :new_consultation_computer_diagnoses do |consultation|
  link 'Solicitar diagnóstico', new_consultation_computer_diagnoses_path(consultation)
  parent :patient_consultation, consultation.patient, consultation
end

crumb :new_consultation_human_diagnoses do |consultation|
  link 'Establecer diagnóstico', new_consultation_human_diagnoses_path(consultation)
  parent :patient_consultation, consultation.patient, consultation
end




# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).