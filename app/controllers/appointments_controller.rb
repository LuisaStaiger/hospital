class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show]

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      redirect_to @appointment, notice: 'Appointment was successfully created.'
    else
      render :new
    end
  end

  def index
    @appointments = Appointment.all
  end

  def show
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:date, :cause, :urgent, :doctor_id, :patient_id)
  end
end
