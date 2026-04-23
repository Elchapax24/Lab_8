Owner.create!(
  first_name: "Juan",
  last_name: "Perez",
  email: "juan@example.com",
  phone: "123456789",
  address: "Santiago"
)

Owner.create!(
  first_name: "Maria",
  last_name: "Gonzalez",
  email: "maria@example.com",
  phone: "987654321",
  address: "Valparaiso"
)

Owner.create!(
  first_name: "Pedro",
  last_name: "Ramirez",
  email: "pedro@example.com",
  phone: "456123789",
  address: "Concepcion"
)
owners = Owner.all

owners[0].pets.create!(
  name: "Firulais",
  species: "Dog",
  breed: "Labrador",
  date_of_birth: "2020-05-10",
  weight: 25.5
)

owners[0].pets.create!(
  name: "Michi",
  species: "Cat",
  breed: "Siames",
  date_of_birth: "2021-03-15",
  weight: 4.2
)

owners[1].pets.create!(
  name: "Bunny",
  species: "Rabbit",
  breed: "Mini Lop",
  date_of_birth: "2022-01-01",
  weight: 2.1
)

owners[2].pets.create!(
  name: "Rocky",
  species: "Dog",
  breed: "Bulldog",
  date_of_birth: "2019-07-20",
  weight: 18.0
)

owners[2].pets.create!(
  name: "Luna",
  species: "Cat",
  breed: "Persa",
  date_of_birth: "2020-11-11",
  weight: 3.8
)
vet1 = Vet.create!(
  first_name: "Ana",
  last_name: "Lopez",
  email: "ana@vet.com",
  phone: "111222333",
  specialization: "General Practice"
)

vet2 = Vet.create!(
  first_name: "Carlos",
  last_name: "Martinez",
  email: "carlos@vet.com",
  phone: "444555666",
  specialization: "Surgery"
)
pets = Pet.all

appt1 = Appointment.create!(
  pet: pets[0],
  vet: vet1,
  date: Time.now + 1.day,
  reason: "Check-up",
  status: :scheduled
)

appt2 = Appointment.create!(
  pet: pets[1],
  vet: vet1,
  date: Time.now,
  reason: "Vaccination",
  status: :in_progress
)

appt3 = Appointment.create!(
  pet: pets[2],
  vet: vet2,
  date: Time.now - 1.day,
  reason: "Injury",
  status: :completed
)

appt4 = Appointment.create!(
  pet: pets[3],
  vet: vet2,
  date: Time.now + 2.days,
  reason: "Skin issue",
  status: :scheduled
)

appt5 = Appointment.create!(
  pet: pets[4],
  vet: vet1,
  date: Time.now - 2.days,
  reason: "General check",
  status: :cancelled
)

appointments = Appointment.all

Treatment.create!(
  appointment: appointments[1], # in progress
  name: "Vaccine",
  medication: "Rabies Vaccine",
  dosage: "1 dose",
  notes: "Administered successfully",
  administered_at: Time.now
)

Treatment.create!(
  appointment: appointments[2], # completed
  name: "Surgery",
  medication: "Anesthesia",
  dosage: "Standard",
  notes: "Successful operation",
  administered_at: Time.now
)

Treatment.create!(
  appointment: appointments[2],
  name: "Pain Relief",
  medication: "Ibuprofen",
  dosage: "2x daily",
  notes: "Post-surgery care",
  administered_at: Time.now
)

Treatment.create!(
  appointment: appointments[1],
  name: "Check-up",
  medication: "None",
  dosage: "N/A",
  notes: "Healthy",
  administered_at: Time.now
)

Treatment.create!(
  appointment: appointments[2],
  name: "Follow-up",
  medication: "Antibiotics",
  dosage: "5 days",
  notes: "Recovery ongoing",
  administered_at: Time.now
)