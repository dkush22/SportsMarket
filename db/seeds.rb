

User.create(username: "dkush22", password: "test", budget: 10000)
User.create(username: "roman", password: "test")

response = RestClient::Request.execute method: :get, url: 'https://api.mysportsfeeds.com/v1.1/pull/nfl/2017-regular/cumulative_player_stats.json?playerstats=Att,Comp,Yds,TD&position=qb,rb,wr,te', user: 'dkush22', password: 'dkush22'

nfl_data = JSON.parse(response)


nfl_data["cumulativeplayerstats"]["playerstatsentry"].each do |item|
	NflAthlete.create(name: item["player"]["FirstName"] + " " + item["player"]["LastName"], position: item["player"]["Position"], team: item["team"]["Abbreviation"], passing_yards: item["stats"]["PassYards"]["#text"], passing_touchdowns: item["stats"]["PassTD"]["#text"], rushing_yards: item["stats"]["RushYards"]["#text"], rushing_touchdowns: item["stats"]["RushTD"]["#text"], receiving_yards: item["stats"]["RecYards"]["#text"], receiving_touchdowns: item["stats"]["RecTD"]["#text"], actual_fantasy_value: (item["stats"]["PassYards"]["#text"].to_f * 0.04).to_f + (item["stats"]["PassTD"]["#text"].to_f * 4).to_f + (item["stats"]["RushYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RushTD"]["#text"].to_f * 6).to_f + (item["stats"]["RecYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RecTD"]["#text"].to_f * 6).to_f)
end

Investment.create(user_id: 1, nfl_athlete_id: 754, quantity: 2)

