class PatientsController < ApplicationController
  before_action :set_patient, only: %i[create edit update destroy show]

  def index
    @uncured_patients = Patient.where(cured: false)
  end

  def new
    @patient = Patient.new
  end

  def show
    @appointments = @patient.appointments
  end

  def create
    if @patient.save
      redirect_to patients_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @patient.update(patient_params)
    redirect_to patient_path(@patient)
    else
      render :edit
    end
  end

  def destroy
    @patient.destroy
    redirect_to patients_path
  end

  private

  def set_patient
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :insurance, :cured)
  end
end
