require 'rails_helper'

RSpec.describe 'Hospital Show Page' do
  it 'displays the hospitals name' do
    hospital = Hospital.create!(name: "Good Hospital")

    visit hospital_path(hospital.id)

    expect(page).to have_content('Name:')
    expect(page).to have_content('Good Hospital')
  end

  it 'displays the number of doctors working at the hospital' do
    hospital = Hospital.create!(name: "Good Hospital")
    doctor1 = hospital.doctors.create!(name: "Dr", specialty: "General Surgery", university: "Stanford University")
    doctor2 = hospital.doctors.create!(name: "Doc", specialty: "General Surgery", university: "University of Pittsburgh")

    visit hospital_path(hospital.id)

    expect(page).to have_content('Number of Doctors: 2')
  end

  it 'displays a unique list of all universities' do
    hospital = Hospital.create!(name: "Good Hospital")
    doctor1 = hospital.doctors.create!(name: "Dr", specialty: "General Surgery", university: "Stanford University")
    doctor2 = hospital.doctors.create!(name: "Doc", specialty: "General Surgery", university: "University of Pittsburgh")
    doctor3 = hospital.doctors.create!(name: "Doctor", specialty: "General Surgery", university: "University of Pittsburgh")

    visit hospital_path(hospital.id)

    expect(page).to have_content('Universities:')
    expect(page).to have_content('Stanford University')
    expect(page).to have_content('University of Pittsburgh').once
  end
end