class User < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :cleaners, through: :appointments
end
