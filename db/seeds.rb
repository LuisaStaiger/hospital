# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Make sure to require the necessary models
require "faker"

Doctor.destroy_all
Education.destroy_all

puts 'All doctors destroyed from the database.'
puts 'Creating 5 fake doctors and educations...'

5.times do
  doctor = Doctor.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    title: ['Dr', 'Prof'].sample,
    available: Faker::Boolean.boolean,
    speciality: ['Dermatologist', 'Pneumologist', 'Cardiologist', 'Dentist', 'GP'].sample,
    experience: Faker::Number.between(from: 2, to: 6)
  )
  doctor.save!

  2.times do
    doctor.educations.create(
      university: Faker::University.name,
      degree_name: Faker::Educator.degree,
      score: Faker::Number.between(from: 70, to: 100)
    )
    education.save!
  end
end
puts 'Finished!'

Patient.destroy_all
puts 'All patient destroyed from the database.'

puts 'Creating 5 fake patients...'
5.times do
  patient = Patient.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    insurance: ['Privat', 'Public'].sample,
    cured: Faker::Boolean.boolean
  )
  patient.save!
end
puts 'Finished!'
