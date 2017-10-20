class InvestmentSerializer < ActiveModel::Serializer
 attributes :id, :user_id, :nfl_athlete_id, :quantity, :acquisition_price, :created_at


 belongs_to :user
belongs_to :nfl_athlete


end
