require 'rails_helper'

RSpec.describe Patient do
  describe 'relationships' do
    it { should have_many(:doctor_patients) }
    it { should have_many(:doctors).through(:doctor_patients) }
  end
  
  describe '::by_age' do
    it 'orders all patients by age' do
      hospital = Hospital.create!(name: "Good Hospital")
      doctor = hospital.doctors.create!(name: "Dr", specialty: "General Surgery", university: "Stanford University")
      patient1 = Patient.create!(name: 'Bob', age: 26)
      patient2 = Patient.create!(name: 'John', age: 27)
      DoctorPatient.create!(doctor_id: doctor.id, patient_id: patient1.id)
      DoctorPatient.create!(doctor_id: doctor.id, patient_id: patient2.id)

      expect(Patient.by_age).to eq([patient2, patient1])
    end
  end
end