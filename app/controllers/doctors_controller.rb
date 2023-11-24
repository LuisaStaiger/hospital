class DoctorsController < ApplicationController

  def index
    @doctors = Doctor.all
    @images = [
      "https://ca.slack-edge.com/T02NE0241-U05VC47MN2C-412d83f67519-512",
      "https://ca.slack-edge.com/T02NE0241-U05USV5HM7E-28be3e669fda-512",
      "https://ca.slack-edge.com/T02NE0241-U05UKKHMXNZ-87a5b75e2103-192",
      "https://ca.slack-edge.com/T02NE0241-U05UM1VT4EN-7328fe9f3fbc-512",
      "https://ca.slack-edge.com/T02NE0241-U05UR60R4UC-222ea601ced6-512",
    ]
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
    params.require(:doctor).permit(:first_name, :last_name, :available, :title, :speciality, :experience)
  end

end
