class Cleaner < ApplicationRecord
    has_many :appointments, dependant: :destroy
    has_many :users, through: :appointments
end
