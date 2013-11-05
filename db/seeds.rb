# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'Creating Admin user in Admin: model'
Admin.create(email: 'admin@admin.com', password: 'alzheimer', password_confirmation: 'alzheimer')
puts 'Ends creating Admin user in Admin model '

puts 'Creating patients example'

Patient.create(
    name: 'p_Manuel',
    surname: 'Abad Lopez'
)
Patient.create(
    name: 'p_Victoria',
    surname: 'Abaroa Bilbao',
    birth: Date.new(1922,5,1)
)
Patient.create(
    name: 'p_ROSA',
    surname: 'ABIÁN CASUSO '
)

Patient.create(
    name: 'p_PEDRO',
    surname: 'VIVANCO MARTINEZ',
    birth: Date.new(1945,2,3)
)