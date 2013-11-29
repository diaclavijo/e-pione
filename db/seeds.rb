# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'Creating Admin user in Admin: model'

Admin.create(email: 'admin@admin.com', password: 'alzheimer', password_confirmation: 'alzheimer') if Admin.all.empty?
puts 'Ends creating Admin user in Admin model '

puts 'Creating Physician '
Physician.create(name: 'Carmen Paz', surname: 'Suarez Araujo', email: 'carmen@carmen.com', password: 'alzheimer', password_confirmation: 'alzheimer') if Physician.all.empty?


puts 'Creating patients example'


(1..10).each{|i|
  Patient.create(
      name: 'p_Manuel'+ i.to_s,
      surname: 'Abad Lopez'
  )
  Patient.create(
      name: 'p_Victoria' + i.to_s ,
      surname: 'Abaroa Bilbao',
      birth: Date.new(1922,5,1)
  )
  Patient.create(
      name: 'p_ROSA' + i.to_s  ,
      surname: 'ABIÁN CASUSO '
  )

  Patient.create(
      name: 'p_PEDRO' + i.to_s ,
      surname: 'VIVANCO MARTINEZ',
      birth: Date.new(1945,2,3)
  )
} if Patient.all.empty?


puts 'Creating consultaions example'

(1..5).each{|i|
  Consultation.create(
      physician_id: Physician.first.id,
      patient_id: Patient.first.id,
      activity: i % 3               ,
      description: 'otra descripción más del numero'+i.to_s
  )

} if Consultation.all.empty?