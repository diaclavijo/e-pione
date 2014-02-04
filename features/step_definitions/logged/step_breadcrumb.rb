Then(/^physician should see a breadcrumb remarking the actual page, "([^"]*)" and showing the path on how to get there$/) do |arg|
  check_breadcrumb(arg)
end