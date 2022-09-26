require 'rails_helper'

RSpec.describe Doctor do
  it {should belong_to :hospital}

  describe 'methods' do
    before :each do
      @doc1 = Doctor.create(name: 'Meredith Grey', specialty: 'General Surgery', university: 'Harvard University')
      @doc2 = Doctor.create(name: 'Alex Karev', specialty: 'Pediatric Surgery', university: 'Johns Hopkins University')

      @patient1 = Patient.create(name: 'Bruce Wayne', age: 37)
      @patient2 = Patient.create(name: 'Tom Hardy', age: 46)
      @patient3 = Patient.create(name: 'Edward Nigma', age: 28)
      @patient4 = Patient.create(name: 'Jason Todd', age: 17)
      @patient4 = Patient.create(name: 'Penguin', age: 9)

      @patient_doc1 = PatientDoctor.create(doctor_id: @doc1.id, patient_id: @patient1.id)
      @patient_doc2 = PatientDoctor.create(doctor_id: @doc1.id, patient_id: @patient2.id)
      @patient_doc3 = PatientDoctor.create(doctor_id: @doc1.id, patient_id: @patient3.id)
      @patient_doc4 = PatientDoctor.create(doctor_id: @doc2.id, patient_id: @patient4.id)
    end

    it 'can count a doctors patients' do
      expect(@doc1.patient_count).to eq(3)

    end
  end

end
