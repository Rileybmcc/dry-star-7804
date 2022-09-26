require 'rails_helper'

RSpec.describe 'patients index page' do

  it 'displays all adult patients' do
    patient1 = Patient.create(name: 'Bruce Wayne', age: 37)
    patient2 = Patient.create(name: 'Tom Hardy', age: 46)
    patient3 = Patient.create(name: 'Edward Nigma', age: 28)
    patient4 = Patient.create(name: 'Jason Todd', age: 16)

    visit patients_path

    expect(page).to have_content("Bruce Wayne")
    expect(page).to have_content("Tom Hardy")
    expect(page).to have_content("Edward Nigma")
    expect(page).to_not have_content("Jason Todd")
  end

  it 'displays adult patients in ascending alphabetical order' do
    patient1 = Patient.create(name: 'Bruce Wayne', age: 37)
    patient2 = Patient.create(name: 'Tom Hardy', age: 46)
    patient3 = Patient.create(name: 'Edward Nigma', age: 28)
    patient4 = Patient.create(name: 'Jason Todd', age: 16)

    visit patients_path

    expect("#{patient1.name}").to appear_before("#{patient3.name}")
    expect("#{patient3.name}").to appear_before("#{patient2.name}")
  end

end
