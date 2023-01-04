class Api::V1::CleanersController < ApplicationController
  def index
    @cleaners = Cleaner.all

    render json: @cleaners
  end
end
