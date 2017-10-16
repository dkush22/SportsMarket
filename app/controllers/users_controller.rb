class UsersController < ApplicationController
  # skip_before_action :authorized, only: [:create, :index, :show]


def index
	@users = User.all
	render json: @users, status: 200
end

def show
	@user = User.find(params[:id])
	render json: @user, status: 200
end

def create
  user = User.new(username: params[:username], password: params[:password])
  if user.save
    token = encode_token({ user_id: user.id})
    render json: {user: user, jwt: token}
  else
  end
end


def new
  user = User.new(username: params[:username], password: params[:password])
  if user.save
    render json: {username: user.username, password: user.password}
  end
end

def google
  puts "hello"
end



def me
  if @user
    render json: { user: @user, investments: @user.investments, nfl_athletes: @user.nfl_athletes}
  else
    render json: { message: "Error"}
  end
end


end