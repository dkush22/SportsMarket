class NflAthletesController < ApplicationController

require 'rest-client'



def index

response = RestClient::Request.execute method: :get, url: 'https://api.mysportsfeeds.com/v1.1/pull/nfl/2017-regular/cumulative_player_stats.json?playerstats=Att,Comp,Yds,TD&position=qb', user: 'dkush22', password: 'dkush22'
render json: response
end



end