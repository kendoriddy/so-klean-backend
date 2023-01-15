class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all

    render json: @users
  end

  def show
    render json: @user
  end
end


def show
  @doctor = Doctor.includes(:appointments).find(params[:id])

  @appointments = @doctor.appointments.order(created_at: :desc)

  render json: {
    doctor: @doctor,
    appointments: @appointments
  }.to_json, status: :created
end