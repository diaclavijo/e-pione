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
  link patient.full_name, patient_path(patient)
  parent :patients
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