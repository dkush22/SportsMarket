class NflAthlete < ApplicationRecord

has_many :investments
has_many :users, through: :investments



def self.midnight_task 
response = RestClient::Request.execute method: :get, url: 'https://api.mysportsfeeds.com/v1.1/pull/nfl/2017-regular/cumulative_player_stats.json?playerstats=Att,Comp,Yds,TD&position=qb,rb,wr,te', user: 'dkush22', password: 'dkush22'

nfl_data = JSON.parse(response)

nfl_data["cumulativeplayerstats"]["playerstatsentry"].each do |item|
	nflPlayer = NflAthlete.find_by(name: item["player"]["FirstName"] + " " + item["player"]["LastName"])
	if nflPlayer
	nflPlayer.update(passing_yards: item["stats"]["PassYards"]["#text"], passing_touchdowns: item["stats"]["PassTD"]["#text"], rushing_yards: item["stats"]["RushYards"]["#text"], rushing_touchdowns: item["stats"]["RushTD"]["#text"], receiving_yards: item["stats"]["RecYards"]["#text"], receiving_touchdowns: item["stats"]["RecTD"]["#text"], actual_fantasy_value: ((item["stats"]["PassYards"]["#text"].to_f * 0.04).to_f + (item["stats"]["PassTD"]["#text"].to_f * 4).to_f + (item["stats"]["RushYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RushTD"]["#text"].to_f * 6).to_f + (item["stats"]["RecYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RecTD"]["#text"].to_f * 6)) / (item["stats"]["GamesPlayed"]["#text"].to_i))
	nflPlayer.save
end
end

fantasy = RestClient.get('https://api.fantasydata.net/v3/nfl/projections/json/PlayerSeasonProjectionStats/2017', headers={'Ocp-Apim-Subscription-Key': 'b14c25cf48744d719cff8a70ac98c886'})
fantasy_data = JSON.parse(fantasy)


fantasy_data.each do |player|
fantasynflplayer = NflAthlete.find_by(name: player["Name"])

if fantasynflplayer
fantasynflplayer.update(initial_stock_value: (player["FantasyPointsYahoo"] / 4), current_stock_value: ((fantasynflplayer.actual_fantasy_value) / (player["FantasyPointsYahoo"] / 16)) * (player["FantasyPointsYahoo"] / 4), fantasy_projection: (player["FantasyPointsYahoo"] / 16))
fantasynflplayer.save
end
end
end


end
