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

    expect(page).to have_content('Hosptial: Good Hospital')
  end

  it 'displays all the patients the doctor has' do
    hospital = Hospital.create!(name: "Good Hospital")
    doctor = hospital.doctors.create!(name: "Dr", specialty: "General Surgery", university: "Stanford University")
    patient1 = Patient.create!(name: 'Bob', age: 26)
    patient1 = Patient.create!(name: 'John', age: 27)

    visit doctor_path(doctor.id)

    expect(page).to have_content('Patients:')
    expect(page).to have_content('Bob')
    expect(page).to have_content('John')
  end
end