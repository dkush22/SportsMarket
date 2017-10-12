class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password_digest, :budget

has_many :investments
has_many :nfl_athletes, through: :investments

end
