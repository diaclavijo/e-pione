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