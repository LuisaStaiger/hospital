class DoctorsController < ApplicationController

  def index
    @doctors = Doctor.all
  end

  def show
    @doctor = Doctor.find(params[:id])
  end

  def new
    @doctor = Doctor.new # Needed to instantiate the form_with
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      redirect_to root_path, notice: 'Doctor was successfully created.'
    else
      render :new
    end
  end

  def edit
    @doctor = Doctor.find(params[:id])
  end

  def update
    @doctor = Doctor.find(params[:id])
    if @doctor.update(doctor_params) # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to doctor_path(@doctor)
    else
      render :edit
    end
  end

  def destroy
    @doctor = Doctor.find(params[:id])
    @doctor.destroy
    redirect_to root_path, notice: 'Doctor was successfully deleted.'
  end

  private

  def doctor_params
    params.require(:doctor).permit(:first_name, :last_name)
  end

end
