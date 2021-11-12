require 'rails_helper'

RSpec.describe 'Patient Index Page' do
  it 'displays all patients from oldest to youngest' do
    hospital = Hospital.create!(name: "Good Hospital")
    doctor = hospital.doctors.create!(name: "Dr", specialty: "General Surgery", university: "Stanford University")
    patient1 = Patient.create!(name: 'Bob', age: 26)
    patient2 = Patient.create!(name: 'John', age: 27)
    DoctorPatient.create!(doctor_id: doctor.id, patient_id: patient1.id)
    DoctorPatient.create!(doctor_id: doctor.id, patient_id: patient2.id)

    visit patients_path

    expect('John').to appear_before('Bob')
  end
end