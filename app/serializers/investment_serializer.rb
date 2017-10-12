class InvestmentSerializer < ActiveModel::Serializer
 attributes :id, :user_id, :nfl_athlete_id, :quantity


 belongs_to :user
belongs_to :nfl_athlete


end
