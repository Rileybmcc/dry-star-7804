require 'rails_helper'

RSpec.describe 'docotor show page' do

  it '' do
    hospital1 = Hospital.create(name: 'Mercy General')
    doc1 = Doctor.create(hospital_id: hospital1.id, name: 'Dr. Wolowitz', specialty: 'Internal Medicine', university: 'ABC State')
    patient1 = Patient.create(name: 'Tom Hardy', age: 46)
    patient_doc1 = PatientDoctor.create(doctor_id: doc1.id, patient_id: patient1.id)

    visit doctor_path(doc1.id)
save_and_open_page
    expect(page).to have_content("#{doc1.name}")
    expect(page).to have_content("#{doc1.specialty}")
    expect(page).to have_content("#{doc1.university}")

    expect(page).to have_content("#{hospital1.name}")
    expect(page).to have_content("#{patient1.name}")
  end


end
