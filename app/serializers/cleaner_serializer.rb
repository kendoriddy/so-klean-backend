class CleanerSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :charges, :photo
  has_many :appointments
end
