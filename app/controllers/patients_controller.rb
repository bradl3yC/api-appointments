class PatientsController < ApplicationController
  def index
    @patients = Patient.all.includes(:notes, :appointments)

    render json: @patients, status: :ok
  end

  def show
    @patient = Patient.find(params[:id])

    render json: @patient, status: :ok
  end

  def create
    @patient = Patient.create(patient_params)

    @patient.save

    render json: @patient, status: :created
  end

  def update
    @patient = Patient.find(params[:id])

    if @patient.update(patient_params)
      head(:ok)
    else
      head(:unprocessable_entity)
    end

  end

  def destroy
    @patient = Patient.find(params[:id])
    if @patient.destroy
      head(:ok)
    else
      head(:unprocessable_entity)
    end
  end

  private

  def patient_params
    params.require(:patient).permit(:name, :address, :phone_number)
  end

end
