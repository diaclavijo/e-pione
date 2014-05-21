# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'Creating Admin user in Admin: model'
Admin.create(email: 'almendro@almendro.com', password: 'alq4EDA2002', password_confirmation: 'alq4EDA2002')
puts 'Ends creating Admin user in Admin model'

puts 'Creating Phsicians '
Physician.create(email: 'prueba@prueba.com',
                 password: 'cocodrilo',
                 password_confirmation: 'cocodrilo',
                 name: 'Prueba',
                 surname: 'Prueba')
Physician.create(email: 'alguien@alguien.com',
                 password: 'alzheimer',
                 password_confirmation: 'alzheimer',
                 name: 'Alguien',
                 surname: 'Con Apellidos')
Physician.create(email: 'hanfrivogar-2@yahoo.es',
                 password: 'alzheimer',
                 password_confirmation: 'alzheimer',
                 name: 'Hanfri',
                 surname: 'Vogar')
Physician.create(email: 'yeray.alvarez.romero@gmail.com',
                 password: 'alzheimer',
                 password_confirmation: 'alzheimer',
                 name: 'Yeray',
                 surname: 'Álvarez Romero')
Physician.create(email: 'david@diazclavijo.com',
                 password: 'alzheimer',
                 password_confirmation: 'alzheimer',
                 name: 'David',
                 surname: 'Díaz Clavijo')

Physician.create(email: 'david@diazclavijo.com',
                 password: 'alzheimer',
                 password_confirmation: 'alzheimer',
                 name: 'David',
                 surname: 'Díaz Clavijo')
Physician.create(email: 'ccarnerop@gmail.com', password: 'fototest', password_confirmation: 'fototest', name: 'Cristóbal', surname: 'Carnero')
Physician.create(email: 'fototest@fototest.com', password: 'cocodrilo', password_confirmation: 'cocodrilo', name: 'Fototest', surname: 'Fototest', default_test: 'fototest')
Physician.create(email: 'milohu@live.com', password: 'pino', password_confirmation: 'pino', name: 'Milohu', surname: 'Milohu')
Physician.create(email: 'alejandrocarlos@gmail.com', password: 'pino', password_confirmation: 'pino', name: 'Alejandro', surname: 'Carlos')
Physician.create(email: '
naguilar@grupoicot.es', password: 'pino', password_confirmation: 'pino', name: 'David', surname: 'Díaz Clavijo')
Physician.create(email: 'david@diazclavijo.com', password: 'pino', password_confirmation: 'pino', name: 'David', surname: 'Díaz Clavijo')

puts 'Ends creating Physicians '

puts 'Creating patients example'

