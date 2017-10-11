class AppointmentsController < ApplicationController
  def index
    @appointments = Appointments.all

    render json: @appointments, status: :ok
  end

  def show
    @appointment = Appointment.find(params[:id])

    render json: @appointment, status: :ok
  end

  def create
    @appointment = Appointment.create(appointment_params)

    @appointment.save

    render json: @appointment, status: :created
  end

  def update
    @appointment = Appointment.find(params[:id])

    if @appointment.update(appointment_params)
      head(:ok)
    else
      head(:unprocessable_entity)
    end

  end

  def destroy
    @appointment = Appointment.find(params[:id])
    if @appointment.destroy
      head(:ok)
    else
      head(:unprocessable_entity)
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:date_time, :patient_id)
  end


end
