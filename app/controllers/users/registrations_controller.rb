class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json
  private
  def respond_with(resource, _opts = {})
    if resource.persisted?
      render json: { message: 'Signed up.' }
    else
      render json: { message: "Signed up failure." }
    end
  end
end