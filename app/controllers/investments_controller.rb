class InvestmentsController < ApplicationController


def index
	@investments = Investment.all
	render json: @investments.sort_by {|investment| investment.id}, status: 200
end

def show
	@investment = Investment.find(params[:id])
	render json: @investment, status: 200
end

def create
  @investment = Investment.new(user_id: params[:user_id], nfl_athlete_id: params[:nfl_athlete_id], quantity: params[:quantity], acquisition_price: params[:acquisition_price])
  @investment.user.budget = (@investment.user.budget - (@investment.nfl_athlete.current_stock_value * @investment.quantity))
  if @investment.user.valid?
  if @investment.valid?
  	@investment.save
  	@investment.user.save
    render json: {investment: @investment, user_id: @investment.user_id, nfl_athlete_id: @investment.nfl_athlete_id, quantity: @investment.quantity, acquisition_price: @investment.acquisition_price}
else render json: {message: "Can't invest with quantity of 0"} 
end   
else render json: {message: "You can't go below $0"}
  end
end

def update
	@investment = Investment.find(params[:id])
	@investment.quantity -= params[:quantity]
	if @investment.update(quantity: @investment.quantity)
		@investment.user.update(budget: @investment.user.budget + (@investment.nfl_athlete.current_stock_value * params[:quantity]))
		render json: {investment: @investment, user_id: @investment.user_id, nfl_athlete_id: @investment.nfl_athlete_id, quantity: @investment.quantity, acquisition_price: @investment.acquisition_price}
	end

end

def destroy
@investment = Investment.find(params[:id])
@investment.user.update(budget: @investment.user.budget + (@investment.nfl_athlete.current_stock_value * @investment.quantity))
@investment.destroy
render json: @investment
end

private


def investment_params

params.require(:investment).permit(:id, :user_id, :nfl_athlete_id, :quantity, :acquisition_price)

end


end