class Api::V1::AppointmentsController < ApplicationController
  def index
    @appointments = current_user.appointments

    render json: @appointments
  end
end
