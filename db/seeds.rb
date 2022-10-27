# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

doctors = []
patients = []

20.times do
  patient = Patient.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
  patients << patient
end

10.times do
  doctor = Doctor.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
  doctors << doctor
end

40.times do
  Appointment.create(
    doctor_id: doctors[rand(0..9)].id,
    patient_id: patients[rand(0..19)].id,
    date: Faker::Date.between(from: 2.days.ago, to: 3.year.from_now)
  )
end