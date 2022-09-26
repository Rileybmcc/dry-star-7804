require 'rails_helper'

RSpec.describe 'hospital show page' do

  before :each do
    @hospital1 = Hospital.create(name: 'Mercy General')
    @hospital2 = Hospital.create(name: 'Grey Sloan Memorial Hospital')

    @doc1 = Doctor.create(hospital_id: @hospital1.id, name: 'Meredith Grey', specialty: 'General Surgery', university: 'Harvard University')
    @doc2 = Doctor.create(hospital_id: @hospital1.id, name: 'Alex Karev', specialty: 'Pediatric Surgery', university: 'Johns Hopkins University')
    @doc3 = Doctor.create(hospital_id: @hospital1.id, name: 'Miranda Bailey', specialty: 'General Surgery', university: 'Stanford University')
    @doc4 = Doctor.create(hospital_id: @hospital2.id, name: 'Derek McDreamy Shepherd', specialty: 'Attending Surgeon', university: 'University of Pennsylvania')

    @patient1 = Patient.create(name: 'Tom Hardy', age: 46)
    @patient_doc1 = PatientDoctor.create(doctor_id: @doc1.id, patient_id: @patient1.id)
    @patient2 = Patient.create(name: 'Alfred', age: 63)
    @patient_doc2 = PatientDoctor.create(doctor_id: @doc2.id, patient_id: @patient2.id)

  end

  it 'displays hospital name and all doctors who work at the hospital' do
    visit hospital_path(@hospital1.id)

    expect(page).to have_content(@hospital1.name)

    expect(page).to have_content(@doc1.name)
    expect(page).to have_content(@doc2.name)
    expect(page).to have_content(@doc3.name)
    expect(page).to_not have_content(@doc4.name)
  end

  it 'displays number of patients for each doctor' do
    visit hospital_path(@hospital1.id)

    expect(page).to have_content("#{@doc1.name} || Patients: 1")
  end


end
