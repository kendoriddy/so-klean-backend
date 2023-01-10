class Api::V1::AppointmentsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @appointments = Appointment.accessible_by(current_ability)
  render json: @appointments
  end
end
