class User < ApplicationRecord
has_secure_password

has_many :investments
has_many :nfl_athletes, through: :investments

validates :username, uniqueness: true
validates :budget, numericality: {greater_than_or_equal_to: 0, message: "Budget can not be less than $0"}


end
