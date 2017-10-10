class User < ApplicationRecord
has_secure_password

has_many :investments
has_many :nfl_athletes, through: :investments


end
