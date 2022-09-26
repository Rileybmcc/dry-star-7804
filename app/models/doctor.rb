class Doctor < ApplicationRecord
  belongs_to :hospital
  has_many :patient_doctors
  has_many :patients, through: :patient_doctors

  def patient_count
# require "pry"; binding.pry
    # doctor.
    id = self.id
    Patient.joins(:doctors).where(doctor_id: :id).select('patient.*').group(:doctor_id)

  end

end
