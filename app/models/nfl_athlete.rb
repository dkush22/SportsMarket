class NflAthlete < ApplicationRecord

has_many :investments
has_many :users, through: :investments
end
