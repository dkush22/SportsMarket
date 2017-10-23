class Investment < ApplicationRecord

belongs_to :user
belongs_to :nfl_athlete

validates :quantity, numericality: {greater_than: 0, message: "Quantity cannot be 0"}
end
