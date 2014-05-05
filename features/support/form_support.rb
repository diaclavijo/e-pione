#Fill a field a list of fields with the given values
# Data has the data like [['field_1','value_1'],['field_2','value_2']]
def fill_fields (fields)
  fields.each do |field, value|
    fill_in field, :with => value  #It will fail if the field is not present
  end
end


def select_dropdowns (dropdowns)
  dropdowns.each do |dropdown, value|
    page.select(value, :from => dropdown)
  end
end


