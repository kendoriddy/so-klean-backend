class Cleaner < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :users, through: :appointments

  validates :name, presence: true
  validates :location, presence: true
  validates :charges, presence: true,
                      numericality: { greater_than_or_equal_to: 1000, less_than_or_equal_to: 100_000, message: 'must be between 1000 and 100000' }
  validates :photo, presence: true
end
