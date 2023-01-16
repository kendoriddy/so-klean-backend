class Users::SessionsController < Devise::SessionsController
  private

  def respond_with(_resource, _opts = {})
    self.resource = warden.authenticate!(scope: :user, username: params[:username], password: params[:password])
    login_success && return if current_user
    login_failed
  end

  def login_success
    render json: {
      message: 'You are logged In',
      user: current_user,
      token: request.env['warden-jwt_auth.token'],
      status: 200
    }, status: :ok
  end

  def login_failed
    render json: {
      message: 'Invalid username or password',
      status: 401
    }, status: :unprocessable_entity
  end

  def respond_to_on_destroy
    log_out_success && return if current_user

    log_out_failure
  end

  def log_out_success
    render json: {
      message: 'You are logged out',
      user: current_user
    }, status: (:ok || :unauthorized)
  end

  def log_out_failure
    render json: {
      message: 'something went wrong',
      status:
    }, status: :unprocessable_entity
  end
end
