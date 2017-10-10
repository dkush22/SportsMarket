class InvestmentsController < ApplicationController


def index
	@investments = Investment.all
	render json: @investments, status: 200
end

def show
	@investment = Investment.find(params[:id])
	render json: @investment, status: 200
end


end