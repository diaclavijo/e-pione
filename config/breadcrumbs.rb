crumb :root do
  link 'Inicio', root_path
end

crumb :patients do
  link 'Búsqueda de pacientes', patients_path
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

crumb :new_patient_consultation do |patient|
  link 'Nueva consulta'
  parent :patient, patient
end

crumb :patient_consultation do |patient, consultation|
  link ('Consulta '+consultation.id.to_s), patient_consultation_path(patient, consultation)
  parent :patient, patient
end

crumb :consultation_cognitive_symptomatology do |consultation|
  link 'Sintomatologia cognitiva', consultation_cognitive_symptomatology_path(consultation)
  parent :patient_consultation, consultation.patient, consultation
end




test_names = { :test_iqcode => 'test del informador', :test_minimental => 'test minimental' }

test_names.each{|key, value|
  crumb :"new_consultation_#{key}" do |consultation|
    link 'Nuevo '+value, send("new_consultation_#{key}_path", consultation)
    parent :consultation_cognitive_symptomatology, consultation
  end
}




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