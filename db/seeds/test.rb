# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'Creating The Cocodrilo physician'
cocodrilo = Physician.create(email: 'prueba@prueba.com',
                             password: 'cocodrilo',
                             password_confirmation: 'cocodrilo',
                             name: 'Cocodrilo',
                             surname: 'Maravillo')
puts 'ERROR: there was some problem writing the Cocodrilo user' if cocodrilo.errors.any?
puts 'End creating cocodrilo physician'

