class Patient < ApplicationRecord
  has_many :patient_doctors
  has_many :doctors, through: :patient_doctors

  def self.find_all_adults
    Patient.select('patients.*')
            .where('age > 18')
            .order('name asc')
  end

end
