class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    user = User.create!(
      username: params['username'],
      email: params['email'],
      password: params['password']
    )
  
    if user
      session[:user_id] = user.id
      render json: {
        status: :created,
        data: user,
      }
    else
      render json: {
        status: 500,
        message: user.errors.full_messages
      }
    end
  end

  private

  def respond_with(resource, _opts = {})
    if resource.persisted?
      render json: {
        status: {code: 200, message: 'Signed up sucessfully.'},
        data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
      }
    else
      render json: {
        status: {message: "User couldn't be created successfully. #{resource.errors.full_messages.to_sentence}"}
      }, status: :unprocessable_entity
    end
  end
end
