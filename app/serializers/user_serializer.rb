class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :email, :username, :created_at
  has_many :appointments
end
