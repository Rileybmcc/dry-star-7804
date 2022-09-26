require 'rails_helper'

RSpec.describe Patient, type: :model do

  describe 'methods' do
    before :each do
      @patient1 = Patient.create(name: 'Bruce Wayne', age: 37)
      @patient2 = Patient.create(name: 'Tom Hardy', age: 46)
      @patient3 = Patient.create(name: 'Edward Nigma', age: 28)
      @patient4 = Patient.create(name: 'Jason Todd', age: 17)
      @patient4 = Patient.create(name: 'Penguin', age: 9)

    end

    it 'only returns patients of at last 18 years of age and orders them aphabetically' do
      expect(Patient.find_all_adults).to eq([@patient1, @patient3, @patient2])
    end

  end

end
