class EducationsController < ApplicationController
  before_action :set_doctor, only: %i[new create edit update]

  def new
    @education = Education.new
  end

  def create
    @education = Education.new(education_params)
    @education.doctor = @doctor
    @education.save
    redirect_to doctor_path(@doctor)
  end

  def edit
    @education = Education.new
  end

  def update
    if @education.update(education_params) # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to doctor_path(@doctor)
    else
      render :edit
    end
  end


  private

  def set_doctor
    @doctor = Doctor.find(params[:doctor_id])
  end

  def education_params
    params.require(:education).permit(:university, :degree_name, :score)
  end
end
