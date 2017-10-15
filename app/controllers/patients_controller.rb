class PatientsController < ApplicationController
  def index
    @patients = current_user.patients.includes(:notes, :appointments)

    render json: @patients, status: :ok
  end

  # /patients/show_date
  def show_date
    date = Date.parse(request.headers["X-For-Date"])

    date_range = (date.beginning_of_day..date.end_of_day)

    current_user_patients = Patient.where(user: current_user)

    @appointments = Appointment.all.where(date_time: date_range).joins(:patient).merge(current_user_patients)

    render json: @appointments, status: :ok
  end

  def find_patient
    @patients = current_user.patients.where(name: request.headers["X-Patient-Name"])
    
    render json: @patients, status: :ok
  end

  def show
    @patient = Patient.find(params[:id])

    render json: @patient, status: :ok
  end

  def create
    @patient = current_user.patients.build(patient_params)
    @patient.save

    render json: @patient, status: :created
  end

  def update

    @patient = current_user.patients.where(id: params[:id]).first

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
    params.require(:patient).permit(:name, :address, :phone_number,
      :visit_frequency, :home_health_company, :assistant)
  end

end
