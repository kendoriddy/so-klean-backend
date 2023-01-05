class AppointmentsSerializer < ActiveModel::Serializer
  attributes :id, :location, :date

  belongs_to :user
  belongs_to :cleaner
end
