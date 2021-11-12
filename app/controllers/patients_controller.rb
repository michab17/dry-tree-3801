class PatientsController < ApplicationController
  def index
    @patients = Patient.by_age
  end
end