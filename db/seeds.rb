City.destroy_all   # Les destroy_all servent à créer une nouvelle base de données vierge a chaque fois que vous lancez ce fichier seeds 
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
		city: City.all.sample #Un echantillon de City.all (des 15 cities qui vont etre créées plus haut) qui sera attribué à un Doctor.
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
	) # array de spé 
end

JoinTableDoctorSpecialty.destroy_all
15.times do |index|
	JoinTableDoctorSpecialty.create!(
		doctor: Doctor.all.sample,
		specialty: Specialty.all.sample
	)
end	#Table qui permet de joindre Doctor et Speciality (relation N/N)