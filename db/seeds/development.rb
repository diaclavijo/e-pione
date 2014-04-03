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

puts 'Creating Admin user in Admin: model'
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
puts 'Ends creating Admin user in Admin model '

puts 'Creating patients example'

unless Patient.any? then
  Patient.create(
      name: 'Soy del primer physician',
      surname: 'Abad Lopez',
      birth: Date.new(1942,5,1),
      education: 3,
      physician_id: 1

  )

  Patient.create(
      name: 'Soy del segundo physician',
      surname: 'Abaroa Bilbao',
      birth: Date.new(1922, 5, 1),
      education: 6,
      physician_id: 2
  )

  Patient.create(
      name: 'Alberto',
      surname: 'Lopez Araujo',
      birth: Date.new(1976, 5, 1),
      education: 5,
      physician_id: 2
  )
end

puts 'Creating consultaions example'

(1..5).each{|i|
  Consultation.create(
      physician_id: Physician.first.id,
      patient_id: Patient.first.id,
      activity: i % 3               ,
      date: Time.now - i**i**i,
      description: 'otra descripción más del numero'+i.to_s
  )
  Consultation.create(
      physician_id: 1,
      patient_id: Patient.last.id,
      activity: 1,
      date: Date.today,
      description: 'otra descripción más del numero'
  )
} if Consultation.all.empty?