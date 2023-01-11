class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :cleaner

  def self.of_customer(user)
    where(user_id: user.id)
  end
end
