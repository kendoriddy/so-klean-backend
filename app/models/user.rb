class User < ApplicationRecord
    has_many :appointments, dependant: :destroy
    has_many :cleaners, through: :appointments
end
