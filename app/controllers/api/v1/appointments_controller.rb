class Api::V1::AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_appointment, only: %i[destroy]
  load_and_authorize_resource

  def index
    @appointments = Appointment.accessible_by(current_ability)
  render json: @appointments
  end

  def create
    p params
    begin
      @appointment = current_user.appointments.new(appointment_params)
      authorize! :create, @appointment
      if @appointment.save
        render json: { status: :success, appointment: @appointment }, status: :created
      else
        render json: { status: :error, errors: @appointment.errors }, status: :unprocessable_entity
      end
    rescue ArgumentError => e
      render json: { status: :error, message: "Invalid date format" }, status: :bad_request
    end
  end

  def destroy
    render json: { message: 'Appointment deleted successfully' } if @appointment.destroy
  end


  private
  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:location, :date, :cleaner_id)
  end

end
