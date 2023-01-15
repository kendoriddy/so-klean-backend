class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :cleaner

  validates :location, presence: true
  validates :date, presence: true

  def self.of_customer(user)
    where(user_id: user.id)
  end
end
