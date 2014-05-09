$data1
$data2

Given(/^Physician is logged and on "([^"]*)" site.$/) do |title|
  initial_checks(new_quick_diagnosis_path, title)
end


Then(/^physician should see a button with gears to send the form$/) do
  pending
end

And(/^the text "([^"]*)"$/) do |arg|
  pending
end


When(/^physician fills in the following:$/) do |table|
  # table is a table.hashes.keys # => [:Puntuación FAQ, :<faq_score>]
  $data1= table.raw
  fill_fields($data1)
end

And(/^when he selects in the following:$/) do |table|
  # table is a table.hashes.keys # => [:Escolaridad, :<education>]
 $data2= table.raw
 select_dropdowns($data2)
end

And(/^clicks on "([^"]*)" button$/) do |button_name|
  click_button (button_name)
end


