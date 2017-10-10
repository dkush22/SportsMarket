class NflAthletesController < ApplicationController

def index
	@players = NflAthlete.all
	render json: @players.sort_by {|player| player.initial_stock_value}.reverse![0..400], status: 200
end

def show
	@player = NflAthlete.find(params[:id])
	render json: @player, status: 200
end
end