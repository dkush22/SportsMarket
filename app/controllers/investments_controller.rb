class InvestmentsController < ApplicationController


def index
	@investments = Investment.all
	render json: @investments, status: 200
end

def show
	@investment = Investment.find(params[:id])
	render json: @investment, status: 200
end

def create
  @investment = Investment.new(user_id: params[:user_id], nfl_athlete_id: params[:nfl_athlete_id], quantity: 1)
  if @investment.save
    render json: {investment: @investment, user_id: @investment.user_id, nfl_athlete_id: @investment.nfl_athlete_id, quantity: @investment.quantity}
  end
end


end