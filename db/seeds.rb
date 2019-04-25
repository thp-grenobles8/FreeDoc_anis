# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
City.destroy_all
15.times do |index|
	City.create!(
		name: Faker::Address.city 
	)
end

Doctor.destroy_all
10.times do |index|
	Doctor.create!(
		first_name: Faker::Name.first_name, 
		last_name: Faker::Name.last_name,
		zip_code: Faker::Address.zip_code,
		city: City.all.sample
	)
end

Patient.destroy_all
15.times do |index|
	Patient.create!(
		first_name: Faker::Name.first_name, 
		last_name: Faker::Name.last_name,
		city: City.all.sample
	)
end

Appointment.destroy_all
20.times do |index|
	Appointment.create!(
		date: Time.at(rand*Time.now.to_i),
		doctor: Doctor.all.sample,
		patient: Patient.all.sample,
		city: City.all.sample
	)		
end	

Specialty.destroy_all
12.times do |index|
	Specialty.create!(
		name: ['ALLERGY & IMMUNOLOGY','DERMATOLOGY','OPHTHALMOLOGY','PEDIATRICS','PSYCHIATRY','SURGERY'].sample 
	)
end

JoinTableDoctorSpecialty.destroy_all
15.times do |index|
	JoinTableDoctorSpecialty.create!(
		doctor: Doctor.all.sample,
		specialty: Specialty.all.sample
	)
end	