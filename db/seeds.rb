

User.create(username: "dkush22", password: "test", budget: 10000)
User.create(username: "roman", password: "test")
User.create(username: "andrew", password: "sandwich")



response = RestClient::Request.execute method: :get, url: 'https://api.mysportsfeeds.com/v1.1/pull/nfl/2017-regular/cumulative_player_stats.json?playerstats=Att,Comp,Yds,TD&position=qb,rb,wr,te', user: 'dkush22', password: 'dkush22'

nfl_data = JSON.parse(response)


nfl_data["cumulativeplayerstats"]["playerstatsentry"].each do |item|
	NflAthlete.create(name: item["player"]["FirstName"] + " " + item["player"]["LastName"], position: item["player"]["Position"], team: item["team"]["Abbreviation"], passing_yards: item["stats"]["PassYards"]["#text"], passing_touchdowns: item["stats"]["PassTD"]["#text"], rushing_yards: item["stats"]["RushYards"]["#text"], rushing_touchdowns: item["stats"]["RushTD"]["#text"], receiving_yards: item["stats"]["RecYards"]["#text"], receiving_touchdowns: item["stats"]["RecTD"]["#text"], actual_fantasy_value: ((item["stats"]["PassYards"]["#text"].to_f * 0.04).to_f + (item["stats"]["PassTD"]["#text"].to_f * 4).to_f + (item["stats"]["RushYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RushTD"]["#text"].to_f * 6).to_f + (item["stats"]["RecYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RecTD"]["#text"].to_f * 6)) / (item["stats"]["GamesPlayed"]["#text"].to_i))
end


fantasy = RestClient.get('https://api.fantasydata.net/v3/nfl/projections/json/PlayerSeasonProjectionStats/2017', headers={'Ocp-Apim-Subscription-Key': 'b14c25cf48744d719cff8a70ac98c886'})
fantasy_data = JSON.parse(fantasy)

fantasy_data.each do |player|
nflplayer = NflAthlete.find_by(name: player["Name"])

if nflplayer
nflplayer.update(initial_stock_value: (player["FantasyPointsYahoo"] / 4), current_stock_value: ((nflplayer.actual_fantasy_value) / (player["FantasyPointsYahoo"] / 16)) * (player["FantasyPointsYahoo"] / 4), fantasy_projection: (player["FantasyPointsYahoo"] / 16))
nflplayer.save
end
end

# Investment.create(user_id: 1, nfl_athlete_id: 754, quantity: 2)
# Investment.create(user_id: 2, nfl_athlete_id: 754, quantity: 5)
# Investment.create(user_id: 1, nfl_athlete_id: 713, quantity: 3)


# user = User.find_by(username: "romanfsiohfsoi")
# if user 
# user.update(budget: 50)
# user.save
# end

