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

puts 'Creating Admin user in Admin: model'
Physician.create(email: 'carmen@carmen.com', password: 'alzheimer', password_confirmation: 'alzheimer', name: 'Carmen Paz', surname: 'Suarez Araujo')
puts 'Ends creating Admin user in Admin model '


puts 'Creating patients example'

Patient.create(
    name: 'p_Manuel',
    surname: 'Abad Lopez',
    NIF:4478199,
    birth: Date.new(1945,2,3),
    gender: 'male',
    civil_status: 'Soltero',
    city: 'Tunte',
    state: 'Las Palmas',
    country:'Spain'

)

Patient.create(
    name: 'p_Victoria',
    surname: 'Abaroa Bilbao',
    birth: Date.new(1922,5,1),
    NIF:4478193,
    gender: 'female',
    civil_status: 'Divorciado',
    city: 'Tunte',
    state: 'Las Palmas',
    country:'Spain'
)
Patient.create(
    name: 'p_ROSA',
    surname: 'ABIÁN CASUSO',
    birth: Date.new(1922,5,1),
    NIF:4478194,
    gender: 'female',
    civil_status: 'Casado',
    city: 'Tunte',
    state: 'Las Palmas',
    country:'Spain'
)

Patient.create(
    name: 'p_PEDRO',
    surname: 'VIVANCO MARTINEZ',
    birth: Date.new(1922,5,1),
    NIF:4478195,
    gender: 'male',
    civil_status: 'Viudo',
    city: 'Tunte',
    state: 'Las Palmas',
    country:'Spain'
)


Patient.create(
    name: 'p_PEDRO',
    surname: 'VIVANCO MARTINEZ',
    birth: Date.new(1922,5,1),
    NIF:44278191234125,
    gender: 'male',
    civil_status: 'Viudo',
    city: 'Tunte',
    state: 'Las Palmas',
    country:'Spain'
)


Patient.create(
    name: 'p_PEDRO',
    surname: 'VIVANCO MARTINEZ',
    birth: Date.new(1922,5,1),
    NIF:447821915,
    gender: 'male',
    civil_status: 'Viudo',
    city: 'Tunte',
    state: 'Las Palmas',
    country:'Spain'
)


Patient.create(
    name: 'p_PEDRO',
    surname: 'VIVANCO MARTINEZ',
    birth: Date.new(1922,5,1),
    NIF:447803419125,
    gender: 'male',
    civil_status: 'Viudo',
    city: 'Tunte',
    state: 'Las Palmas',
    country:'Spain'
)


Patient.create(
    name: 'p_PEDRO',
    surname: 'VIVANCO MARTINEZ',
    birth: Date.new(1922,5,1),
    NIF:447823411915,
    gender: 'male',
    civil_status: 'Viudo',
    city: 'Tunte',
    state: 'Las Palmas',
    country:'Spain'
)



Patient.create(
    name: 'p_PEDRO',
    surname: 'VIVANCO MARTINEZ',
    birth: Date.new(1922,5,1),
    NIF:42478212915,
    gender: 'male',
    civil_status: 'Viudo',
    city: 'Tunte',
    state: 'Las Palmas',
    country:'Spain'
)


