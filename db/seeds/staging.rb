# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'Creating The Ayoze physician'
ayoze = Physician.create(email: 'ayoze@sanroque.com',
												 password: 'alzheimer',
												 password_confirmation: 'alzheimer',
												 name: 'Ayoze',
												 surname: 'González')
puts 'ERROR: there was some problem writing the Ayoze user' if ayoze.errors.any?
puts 'End creating Ayoze physician'

puts 'Creating Phsicians '
Physician.create(email: 'david@diazclavijo.com',
                 password: 'alzheimer',
                 password_confirmation: 'alzheimer',
                 name: 'David',
                 surname: 'Díaz Clavijo')
puts 'Ends creating Physicians '

puts 'Creating The Cocodrilo physician'
cocodrilo = Physician.create(email: 'prueba@prueba.com',
												 password: 'cocodrilo',
												 password_confirmation: 'cocodrilo',
												 name: 'Cocodrilo',
												 surname: 'Maravillo')
puts 'ERROR: there was some problem writing the Cocodrilo user' if cocodrilo.errors.any?
puts 'End creating cocodrilo physician'

puts 'Creating Maria physician'
maria = Physician.create(email: 'perezvieitez@negrin.com',
                             password: 'alzheimer',
                             password_confirmation: 'alzheimer',
                             name: 'María',
                             surname: 'Pérez Vieitez')
puts 'ERROR: there was some problem writing the maria user' if maria.errors.any?
puts 'End creating María physician'

puts 'Creating The Juan Rafael Physician'
rafael = Physician.create(email: 'jgarrodgster@gmail.com',
                             password: 'alzheimer',
                             password_confirmation: 'alzheimer',
                             name: 'Juan Rafael',
                             surname: 'García')
puts 'ERROR: there was some problem writing the Juan Rafael García user' if rafael.errors.any?
puts 'End creating The Juan Rafael physician'

puts 'Creating the admin user'

puts 'Creating Admin user in Admin: model'
Admin.create(email: 'almendro@almendro.com', password: 'alq4EDA2002', password_confirmation: 'alq4EDA2002')
puts 'Ends creating Admin user in Admin model '

puts 'ERROR: there was some problem writing the Admin User' if rafael.errors.any?
puts 'End creating The Juan Rafael physician'
