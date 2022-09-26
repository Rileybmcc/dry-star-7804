class DoctorsController < ApplicationController

  def show
    @doc = Doctor.find(params[:id])
    # require "pry"; binding.pry
  end


end
