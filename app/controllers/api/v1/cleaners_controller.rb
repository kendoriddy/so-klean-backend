class Api::V1::CleanersController < ApplicationController
  # before_action :authenticate_user!
  def index
    @cleaners = Cleaner.all

    render json: @cleaners
  end
end
