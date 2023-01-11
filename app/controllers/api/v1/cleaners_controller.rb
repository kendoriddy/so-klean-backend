class Api::V1::CleanersController < ApplicationController
  load_and_authorize_resource
  # before_action :authenticate_user!
  def index
    @cleaners = Cleaner.all

    render json: @cleaners
  end
end
