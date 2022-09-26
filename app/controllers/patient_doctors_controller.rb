class PatientDoctorsController < ApplicationController

  def destroy
    @patient_doc = PatientDoctor.find_by(doctor_id: params[:doctor_id], patient_id: params[:patient_id])
    @patient_doc.destroy

    redirect_to doctor_path
  end


end
