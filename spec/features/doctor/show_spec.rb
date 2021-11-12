require 'rails_helper'

RSpec.describe 'Doctor Show Page' do
  it 'displays a doctor and all their information' do
    hospital = Hospital.create!(name: "Good Hospital")
    doctor = hospital.doctors.create!(name: "Dr", specialty: "General Surgery", university: "Stanford University")

    visit doctor_path(doctor.id)

    expect(page).to have_content('Name: Dr')
    expect(page).to have_content('Specialty: General Surgery')
    expect(page).to have_content('University: Stanford University')
  end

  it 'displays the hospital that doctor works at' do
    hospital = Hospital.create!(name: "Good Hospital")
    doctor = hospital.doctors.create!(name: "Dr", specialty: "General Surgery", university: "Stanford University")

    visit doctor_path(doctor.id)

    expect(page).to have_content('Hospital: Good Hospital')
  end

  it 'displays all the patients the doctor has' do
    hospital = Hospital.create!(name: "Good Hospital")
    doctor = hospital.doctors.create!(name: "Dr", specialty: "General Surgery", university: "Stanford University")
    patient1 = Patient.create!(name: 'Bob', age: 26)
    patient2 = Patient.create!(name: 'John', age: 27)
    DoctorPatient.create!(doctor_id: doctor.id, patient_id: patient1.id)
    DoctorPatient.create!(doctor_id: doctor.id, patient_id: patient2.id)

    visit doctor_path(doctor.id)

    expect(page).to have_content('Patients:')
    expect(page).to have_content('Bob')
    expect(page).to have_content('John')
  end

  it 'has a button to remove a patient from the doctor' do
    hospital = Hospital.create!(name: "Good Hospital")
    doctor = hospital.doctors.create!(name: "Dr", specialty: "General Surgery", university: "Stanford University")
    patient1 = Patient.create!(name: 'Bob', age: 26)
    patient2 = Patient.create!(name: 'John', age: 27)
    DoctorPatient.create!(doctor_id: doctor.id, patient_id: patient1.id)
    DoctorPatient.create!(doctor_id: doctor.id, patient_id: patient2.id)

    visit doctor_path(doctor.id)

    within "#id-#{patient1.id}" do
      click_button 'Remove Patient'
    end

    expect(current_path).to eq(doctor_path(doctor.id))
    expect(page).to_not have_content('Bob')
  end
end