# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
unless Admin.any?
	puts 'Creating Admin user in Admin: model'
	admin = Admin.create(email: 'racer@racer.com', password: '17198T]r*EO1A7Q', password_confirmation: '17198T]r*EO1A7Q')
	puts 'Error: there was a problem creating the admin user:' + admin.errors if admin.errors.any?
	puts 'Ends creating Admin user in Admin model '
end


