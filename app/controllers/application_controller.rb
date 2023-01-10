class ApplicationController < ActionController::API
  respond_to :json

  include ActionController::MimeResponds

  rescue_from CanCan::AccessDenied do |exception|
    render json: { warning: exception, status: 'authorization_failed' }
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username email password])

    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:username, :password)
    end
  end
end
