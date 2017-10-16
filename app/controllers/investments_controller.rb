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
  @investment = Investment.new(user_id: params[:user_id], nfl_athlete_id: params[:nfl_athlete_id], quantity: params[:quantity], acquisition_price: params[:acquisition_price])
  @investment.user.update(budget: @investment.user.budget - (@investment.nfl_athlete.current_stock_value * @investment.quantity))
  if @investment.save
    render json: {investment: @investment, user_id: @investment.user_id, nfl_athlete_id: @investment.nfl_athlete_id, quantity: @investment.quantity, acquisition_price: @investment.acquisition_price}
  end
end

def delete
@investment = Investment.where(user_id: params[:user_id])
@further = @investment.where(nfl_athlete_id: params[:nfl_athlete_d])
Investment.destroy(@futher[0].id)

end


end