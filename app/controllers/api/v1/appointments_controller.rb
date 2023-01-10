class Api::V1::AppointmentsController < ApplicationController
  def index
    # @appointments = current_user.appointments
    @appointments = Appointment.all

    render json: @appointments
  end
end
