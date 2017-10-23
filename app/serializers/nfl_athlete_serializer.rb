class NflAthleteSerializer < ActiveModel::Serializer
  attributes :id, :name, :position, :team, :passing_yards, :passing_touchdowns, :rushing_yards, :rushing_touchdowns, :receiving_yards, :receiving_touchdowns, :initial_stock_value, :current_stock_value, :fantasy_projection, :actual_fantasy_value, :created_at

# has_many :investments
# has_many :users, through: :investments

end
