class Api::V1::CleanersController < ApplicationController
  load_and_authorize_resource
  # before_action :authenticate_user!
  def index
    @cleaners = Cleaner.all
    render json: @cleaners, status: :ok
  end
  
  def create
    @cleaner = Cleaner.new(cleaner_params)

    if @cleaner.save
      render json: {
        message: 'Cleaner added successfully'
      }, status: :ok

      else
        render json: {
          message: 'Something went wrong, try again'
        }, status: :unprocessable_entity
    end
  end
  
  def cleaner_params
    params.require(:cleaner).permit(:name, :location, :charges)
  end
end