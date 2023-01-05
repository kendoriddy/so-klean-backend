class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    render json: {
      user: current_user,
      message: 'You are in'
    }, status: :ok
  end
end
