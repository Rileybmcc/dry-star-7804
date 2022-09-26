class PatientsController < ApplicationController

  def index
    @adult_patients = Patient.find_all_adults
  end

end
