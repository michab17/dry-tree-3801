require 'rails_helper'

RSpec.describe Hospital do
  describe 'relationships' do
    it { should have_many(:doctors) }
  end

  describe '#universities' do
    it 'returns a unique list of universitys at a hospital' do
      hospital = Hospital.create!(name: "Good Hospital")
      doctor1 = hospital.doctors.create!(name: "Dr", specialty: "General Surgery", university: "Stanford University")
      doctor2 = hospital.doctors.create!(name: "Doc", specialty: "General Surgery", university: "University of Pittsburgh")
      doctor2 = hospital.doctors.create!(name: "Doctor", specialty: "General Surgery", university: "University of Pittsburgh")
      
      expect(hospital.universities.length).to eq(2)
      expect(hospital.universities[0].university).to eq('Stanford University')
      expect(hospital.universities[1].university).to eq('University of Pittsburgh')
    end
  end
end
