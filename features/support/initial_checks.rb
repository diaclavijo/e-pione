def initial_checks(site,title)
  login_with_user
  visit(site)
  page.should have_content(title)
  check_navbar
  if site != new_quick_diagnosis_path
    check_breadcrumb (arg)
    check_back_link
  end
end