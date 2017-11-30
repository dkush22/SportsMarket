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


def self.weekly_stats_one
response_thursday = RestClient::Request.execute method: :get, url: 'https://api.mysportsfeeds.com/v1.1/pull/nfl/2017-regular/daily_player_stats.json?fordate=20170907&playerstats=Att,Comp,Yds,TD&position=qb,rb,wr,te', user: 'dkush22', password: 'dkush22'

nfl_data_thursday = JSON.parse(response_thursday)

nfl_data_thursday["dailyplayerstats"]["playerstatsentry"].each do |item|
nflPlayerThursday = NflAthlete.find_by(name: item["player"]["FirstName"] + " " + item["player"]["LastName"])
if nflPlayerThursday
nflPlayerThursday.update(week_one: ((item["stats"]["PassYards"]["#text"].to_f * 0.04).to_f + (item["stats"]["PassTD"]["#text"].to_f * 4).to_f + (item["stats"]["RushYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RushTD"]["#text"].to_f * 6).to_f + (item["stats"]["RecYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RecTD"]["#text"].to_f * 6)))	
nflPlayerThursday.save
end
end

response_sunday = RestClient::Request.execute method: :get, url: 'https://api.mysportsfeeds.com/v1.1/pull/nfl/2017-regular/daily_player_stats.json?fordate=20170910&playerstats=Att,Comp,Yds,TD&position=qb,rb,wr,te', user: 'dkush22', password: 'dkush22'

nfl_data_sunday = JSON.parse(response_sunday)

nfl_data_sunday["dailyplayerstats"]["playerstatsentry"].each do |item|
nflPlayerSunday = NflAthlete.find_by(name: item["player"]["FirstName"] + " " + item["player"]["LastName"])
if nflPlayerSunday
nflPlayerSunday.update(week_one: ((item["stats"]["PassYards"]["#text"].to_f * 0.04).to_f + (item["stats"]["PassTD"]["#text"].to_f * 4).to_f + (item["stats"]["RushYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RushTD"]["#text"].to_f * 6).to_f + (item["stats"]["RecYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RecTD"]["#text"].to_f * 6)))	
nflPlayerSunday.save
end
end

response_monday = RestClient::Request.execute method: :get, url: 'https://api.mysportsfeeds.com/v1.1/pull/nfl/2017-regular/daily_player_stats.json?fordate=20170911&playerstats=Att,Comp,Yds,TD&position=qb,rb,wr,te', user: 'dkush22', password: 'dkush22'

nfl_data_monday = JSON.parse(response_monday)

nfl_data_monday["dailyplayerstats"]["playerstatsentry"].each do |item|
nflPlayerMonday = NflAthlete.find_by(name: item["player"]["FirstName"] + " " + item["player"]["LastName"])
if nflPlayerMonday
nflPlayerMonday.update(week_one: ((item["stats"]["PassYards"]["#text"].to_f * 0.04).to_f + (item["stats"]["PassTD"]["#text"].to_f * 4).to_f + (item["stats"]["RushYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RushTD"]["#text"].to_f * 6).to_f + (item["stats"]["RecYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RecTD"]["#text"].to_f * 6)))	
nflPlayerMonday.save
end
end
end

def self.weekly_stats_two
response_thursday = RestClient::Request.execute method: :get, url: 'https://api.mysportsfeeds.com/v1.1/pull/nfl/2017-regular/daily_player_stats.json?fordate=20170914&playerstats=Att,Comp,Yds,TD&position=qb,rb,wr,te', user: 'dkush22', password: 'dkush22'

nfl_data_thursday = JSON.parse(response_thursday)

nfl_data_thursday["dailyplayerstats"]["playerstatsentry"].each do |item|
nflPlayerThursday = NflAthlete.find_by(name: item["player"]["FirstName"] + " " + item["player"]["LastName"])
if nflPlayerThursday
nflPlayerThursday.update(week_two: ((item["stats"]["PassYards"]["#text"].to_f * 0.04).to_f + (item["stats"]["PassTD"]["#text"].to_f * 4).to_f + (item["stats"]["RushYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RushTD"]["#text"].to_f * 6).to_f + (item["stats"]["RecYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RecTD"]["#text"].to_f * 6)))	
nflPlayerThursday.save
end
end

response_sunday = RestClient::Request.execute method: :get, url: 'https://api.mysportsfeeds.com/v1.1/pull/nfl/2017-regular/daily_player_stats.json?fordate=20170917&playerstats=Att,Comp,Yds,TD&position=qb,rb,wr,te', user: 'dkush22', password: 'dkush22'

nfl_data_sunday = JSON.parse(response_sunday)

nfl_data_sunday["dailyplayerstats"]["playerstatsentry"].each do |item|
nflPlayerSunday = NflAthlete.find_by(name: item["player"]["FirstName"] + " " + item["player"]["LastName"])
if nflPlayerSunday
nflPlayerSunday.update(week_two: ((item["stats"]["PassYards"]["#text"].to_f * 0.04).to_f + (item["stats"]["PassTD"]["#text"].to_f * 4).to_f + (item["stats"]["RushYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RushTD"]["#text"].to_f * 6).to_f + (item["stats"]["RecYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RecTD"]["#text"].to_f * 6)))	
nflPlayerSunday.save
end
end

response_monday = RestClient::Request.execute method: :get, url: 'https://api.mysportsfeeds.com/v1.1/pull/nfl/2017-regular/daily_player_stats.json?fordate=20170918&playerstats=Att,Comp,Yds,TD&position=qb,rb,wr,te', user: 'dkush22', password: 'dkush22'

nfl_data_monday = JSON.parse(response_monday)

nfl_data_monday["dailyplayerstats"]["playerstatsentry"].each do |item|
nflPlayerMonday = NflAthlete.find_by(name: item["player"]["FirstName"] + " " + item["player"]["LastName"])
if nflPlayerMonday
nflPlayerMonday.update(week_two: ((item["stats"]["PassYards"]["#text"].to_f * 0.04).to_f + (item["stats"]["PassTD"]["#text"].to_f * 4).to_f + (item["stats"]["RushYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RushTD"]["#text"].to_f * 6).to_f + (item["stats"]["RecYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RecTD"]["#text"].to_f * 6)))	
nflPlayerMonday.save
end
end
end

def self.weekly_stats_three
response_thursday = RestClient::Request.execute method: :get, url: 'https://api.mysportsfeeds.com/v1.1/pull/nfl/2017-regular/daily_player_stats.json?fordate=20170921&playerstats=Att,Comp,Yds,TD&position=qb,rb,wr,te', user: 'dkush22', password: 'dkush22'

nfl_data_thursday = JSON.parse(response_thursday)

nfl_data_thursday["dailyplayerstats"]["playerstatsentry"].each do |item|
nflPlayerThursday = NflAthlete.find_by(name: item["player"]["FirstName"] + " " + item["player"]["LastName"])
if nflPlayerThursday
nflPlayerThursday.update(week_three: ((item["stats"]["PassYards"]["#text"].to_f * 0.04).to_f + (item["stats"]["PassTD"]["#text"].to_f * 4).to_f + (item["stats"]["RushYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RushTD"]["#text"].to_f * 6).to_f + (item["stats"]["RecYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RecTD"]["#text"].to_f * 6)))	
nflPlayerThursday.save
end
end

response_sunday = RestClient::Request.execute method: :get, url: 'https://api.mysportsfeeds.com/v1.1/pull/nfl/2017-regular/daily_player_stats.json?fordate=20170924&playerstats=Att,Comp,Yds,TD&position=qb,rb,wr,te', user: 'dkush22', password: 'dkush22'

nfl_data_sunday = JSON.parse(response_sunday)

nfl_data_sunday["dailyplayerstats"]["playerstatsentry"].each do |item|
nflPlayerSunday = NflAthlete.find_by(name: item["player"]["FirstName"] + " " + item["player"]["LastName"])
if nflPlayerSunday
nflPlayerSunday.update(week_three: ((item["stats"]["PassYards"]["#text"].to_f * 0.04).to_f + (item["stats"]["PassTD"]["#text"].to_f * 4).to_f + (item["stats"]["RushYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RushTD"]["#text"].to_f * 6).to_f + (item["stats"]["RecYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RecTD"]["#text"].to_f * 6)))	
nflPlayerSunday.save
end
end

response_monday = RestClient::Request.execute method: :get, url: 'https://api.mysportsfeeds.com/v1.1/pull/nfl/2017-regular/daily_player_stats.json?fordate=20170925&playerstats=Att,Comp,Yds,TD&position=qb,rb,wr,te', user: 'dkush22', password: 'dkush22'

nfl_data_monday = JSON.parse(response_monday)

nfl_data_monday["dailyplayerstats"]["playerstatsentry"].each do |item|
nflPlayerMonday = NflAthlete.find_by(name: item["player"]["FirstName"] + " " + item["player"]["LastName"])
if nflPlayerMonday
nflPlayerMonday.update(week_three: ((item["stats"]["PassYards"]["#text"].to_f * 0.04).to_f + (item["stats"]["PassTD"]["#text"].to_f * 4).to_f + (item["stats"]["RushYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RushTD"]["#text"].to_f * 6).to_f + (item["stats"]["RecYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RecTD"]["#text"].to_f * 6)))	
nflPlayerMonday.save
end
end
end

def self.weekly_stats_four
response_thursday = RestClient::Request.execute method: :get, url: 'https://api.mysportsfeeds.com/v1.1/pull/nfl/2017-regular/daily_player_stats.json?fordate=20170928&playerstats=Att,Comp,Yds,TD&position=qb,rb,wr,te', user: 'dkush22', password: 'dkush22'

nfl_data_thursday = JSON.parse(response_thursday)

nfl_data_thursday["dailyplayerstats"]["playerstatsentry"].each do |item|
nflPlayerThursday = NflAthlete.find_by(name: item["player"]["FirstName"] + " " + item["player"]["LastName"])
if nflPlayerThursday
nflPlayerThursday.update(week_four: ((item["stats"]["PassYards"]["#text"].to_f * 0.04).to_f + (item["stats"]["PassTD"]["#text"].to_f * 4).to_f + (item["stats"]["RushYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RushTD"]["#text"].to_f * 6).to_f + (item["stats"]["RecYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RecTD"]["#text"].to_f * 6)))	
nflPlayerThursday.save
end
end

response_sunday = RestClient::Request.execute method: :get, url: 'https://api.mysportsfeeds.com/v1.1/pull/nfl/2017-regular/daily_player_stats.json?fordate=20171001&playerstats=Att,Comp,Yds,TD&position=qb,rb,wr,te', user: 'dkush22', password: 'dkush22'

nfl_data_sunday = JSON.parse(response_sunday)

nfl_data_sunday["dailyplayerstats"]["playerstatsentry"].each do |item|
nflPlayerSunday = NflAthlete.find_by(name: item["player"]["FirstName"] + " " + item["player"]["LastName"])
if nflPlayerSunday
nflPlayerSunday.update(week_four: ((item["stats"]["PassYards"]["#text"].to_f * 0.04).to_f + (item["stats"]["PassTD"]["#text"].to_f * 4).to_f + (item["stats"]["RushYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RushTD"]["#text"].to_f * 6).to_f + (item["stats"]["RecYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RecTD"]["#text"].to_f * 6)))	
nflPlayerSunday.save
end
end

response_monday = RestClient::Request.execute method: :get, url: 'https://api.mysportsfeeds.com/v1.1/pull/nfl/2017-regular/daily_player_stats.json?fordate=20171002&playerstats=Att,Comp,Yds,TD&position=qb,rb,wr,te', user: 'dkush22', password: 'dkush22'

nfl_data_monday = JSON.parse(response_monday)

nfl_data_monday["dailyplayerstats"]["playerstatsentry"].each do |item|
nflPlayerMonday = NflAthlete.find_by(name: item["player"]["FirstName"] + " " + item["player"]["LastName"])
if nflPlayerMonday
nflPlayerMonday.update(week_four: ((item["stats"]["PassYards"]["#text"].to_f * 0.04).to_f + (item["stats"]["PassTD"]["#text"].to_f * 4).to_f + (item["stats"]["RushYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RushTD"]["#text"].to_f * 6).to_f + (item["stats"]["RecYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RecTD"]["#text"].to_f * 6)))	
nflPlayerMonday.save
end
end
end

def self.weekly_stats_five
response_thursday = RestClient::Request.execute method: :get, url: 'https://api.mysportsfeeds.com/v1.1/pull/nfl/2017-regular/daily_player_stats.json?fordate=20171005&playerstats=Att,Comp,Yds,TD&position=qb,rb,wr,te', user: 'dkush22', password: 'dkush22'

nfl_data_thursday = JSON.parse(response_thursday)

nfl_data_thursday["dailyplayerstats"]["playerstatsentry"].each do |item|
nflPlayerThursday = NflAthlete.find_by(name: item["player"]["FirstName"] + " " + item["player"]["LastName"])
if nflPlayerThursday
nflPlayerThursday.update(week_five: ((item["stats"]["PassYards"]["#text"].to_f * 0.04).to_f + (item["stats"]["PassTD"]["#text"].to_f * 4).to_f + (item["stats"]["RushYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RushTD"]["#text"].to_f * 6).to_f + (item["stats"]["RecYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RecTD"]["#text"].to_f * 6)))	
nflPlayerThursday.save
end
end

response_sunday = RestClient::Request.execute method: :get, url: 'https://api.mysportsfeeds.com/v1.1/pull/nfl/2017-regular/daily_player_stats.json?fordate=20171008&playerstats=Att,Comp,Yds,TD&position=qb,rb,wr,te', user: 'dkush22', password: 'dkush22'

nfl_data_sunday = JSON.parse(response_sunday)

nfl_data_sunday["dailyplayerstats"]["playerstatsentry"].each do |item|
nflPlayerSunday = NflAthlete.find_by(name: item["player"]["FirstName"] + " " + item["player"]["LastName"])
if nflPlayerSunday
nflPlayerSunday.update(week_five: ((item["stats"]["PassYards"]["#text"].to_f * 0.04).to_f + (item["stats"]["PassTD"]["#text"].to_f * 4).to_f + (item["stats"]["RushYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RushTD"]["#text"].to_f * 6).to_f + (item["stats"]["RecYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RecTD"]["#text"].to_f * 6)))	
nflPlayerSunday.save
end
end

response_monday = RestClient::Request.execute method: :get, url: 'https://api.mysportsfeeds.com/v1.1/pull/nfl/2017-regular/daily_player_stats.json?fordate=20171009&playerstats=Att,Comp,Yds,TD&position=qb,rb,wr,te', user: 'dkush22', password: 'dkush22'

nfl_data_monday = JSON.parse(response_monday)

nfl_data_monday["dailyplayerstats"]["playerstatsentry"].each do |item|
nflPlayerMonday = NflAthlete.find_by(name: item["player"]["FirstName"] + " " + item["player"]["LastName"])
if nflPlayerMonday
nflPlayerMonday.update(week_five: ((item["stats"]["PassYards"]["#text"].to_f * 0.04).to_f + (item["stats"]["PassTD"]["#text"].to_f * 4).to_f + (item["stats"]["RushYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RushTD"]["#text"].to_f * 6).to_f + (item["stats"]["RecYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RecTD"]["#text"].to_f * 6)))	
nflPlayerMonday.save
end
end
end

def self.weekly_stats_six
response_thursday = RestClient::Request.execute method: :get, url: 'https://api.mysportsfeeds.com/v1.1/pull/nfl/2017-regular/daily_player_stats.json?fordate=20171012&playerstats=Att,Comp,Yds,TD&position=qb,rb,wr,te', user: 'dkush22', password: 'dkush22'

nfl_data_thursday = JSON.parse(response_thursday)

nfl_data_thursday["dailyplayerstats"]["playerstatsentry"].each do |item|
nflPlayerThursday = NflAthlete.find_by(name: item["player"]["FirstName"] + " " + item["player"]["LastName"])
if nflPlayerThursday
nflPlayerThursday.update(week_six: ((item["stats"]["PassYards"]["#text"].to_f * 0.04).to_f + (item["stats"]["PassTD"]["#text"].to_f * 4).to_f + (item["stats"]["RushYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RushTD"]["#text"].to_f * 6).to_f + (item["stats"]["RecYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RecTD"]["#text"].to_f * 6)))	
nflPlayerThursday.save
end
end

response_sunday = RestClient::Request.execute method: :get, url: 'https://api.mysportsfeeds.com/v1.1/pull/nfl/2017-regular/daily_player_stats.json?fordate=20171015&playerstats=Att,Comp,Yds,TD&position=qb,rb,wr,te', user: 'dkush22', password: 'dkush22'

nfl_data_sunday = JSON.parse(response_sunday)

nfl_data_sunday["dailyplayerstats"]["playerstatsentry"].each do |item|
nflPlayerSunday = NflAthlete.find_by(name: item["player"]["FirstName"] + " " + item["player"]["LastName"])
if nflPlayerSunday
nflPlayerSunday.update(week_six: ((item["stats"]["PassYards"]["#text"].to_f * 0.04).to_f + (item["stats"]["PassTD"]["#text"].to_f * 4).to_f + (item["stats"]["RushYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RushTD"]["#text"].to_f * 6).to_f + (item["stats"]["RecYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RecTD"]["#text"].to_f * 6)))	
nflPlayerSunday.save
end
end

response_monday = RestClient::Request.execute method: :get, url: 'https://api.mysportsfeeds.com/v1.1/pull/nfl/2017-regular/daily_player_stats.json?fordate=20171016&playerstats=Att,Comp,Yds,TD&position=qb,rb,wr,te', user: 'dkush22', password: 'dkush22'

nfl_data_monday = JSON.parse(response_monday)

nfl_data_monday["dailyplayerstats"]["playerstatsentry"].each do |item|
nflPlayerMonday = NflAthlete.find_by(name: item["player"]["FirstName"] + " " + item["player"]["LastName"])
if nflPlayerMonday
nflPlayerMonday.update(week_six: ((item["stats"]["PassYards"]["#text"].to_f * 0.04).to_f + (item["stats"]["PassTD"]["#text"].to_f * 4).to_f + (item["stats"]["RushYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RushTD"]["#text"].to_f * 6).to_f + (item["stats"]["RecYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RecTD"]["#text"].to_f * 6)))	
nflPlayerMonday.save
end
end
end

def self.weekly_stats_seven
response_thursday = RestClient::Request.execute method: :get, url: 'https://api.mysportsfeeds.com/v1.1/pull/nfl/2017-regular/daily_player_stats.json?fordate=20171019&playerstats=Att,Comp,Yds,TD&position=qb,rb,wr,te', user: 'dkush22', password: 'dkush22'

nfl_data_thursday = JSON.parse(response_thursday)

nfl_data_thursday["dailyplayerstats"]["playerstatsentry"].each do |item|
nflPlayerThursday = NflAthlete.find_by(name: item["player"]["FirstName"] + " " + item["player"]["LastName"])
if nflPlayerThursday
nflPlayerThursday.update(week_seven: ((item["stats"]["PassYards"]["#text"].to_f * 0.04).to_f + (item["stats"]["PassTD"]["#text"].to_f * 4).to_f + (item["stats"]["RushYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RushTD"]["#text"].to_f * 6).to_f + (item["stats"]["RecYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RecTD"]["#text"].to_f * 6)))	
nflPlayerThursday.save
end
end

response_sunday = RestClient::Request.execute method: :get, url: 'https://api.mysportsfeeds.com/v1.1/pull/nfl/2017-regular/daily_player_stats.json?fordate=20171022&playerstats=Att,Comp,Yds,TD&position=qb,rb,wr,te', user: 'dkush22', password: 'dkush22'

nfl_data_sunday = JSON.parse(response_sunday)

nfl_data_sunday["dailyplayerstats"]["playerstatsentry"].each do |item|
nflPlayerSunday = NflAthlete.find_by(name: item["player"]["FirstName"] + " " + item["player"]["LastName"])
if nflPlayerSunday
nflPlayerSunday.update(week_seven: ((item["stats"]["PassYards"]["#text"].to_f * 0.04).to_f + (item["stats"]["PassTD"]["#text"].to_f * 4).to_f + (item["stats"]["RushYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RushTD"]["#text"].to_f * 6).to_f + (item["stats"]["RecYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RecTD"]["#text"].to_f * 6)))	
nflPlayerSunday.save
end
end

response_monday = RestClient::Request.execute method: :get, url: 'https://api.mysportsfeeds.com/v1.1/pull/nfl/2017-regular/daily_player_stats.json?fordate=20171023&playerstats=Att,Comp,Yds,TD&position=qb,rb,wr,te', user: 'dkush22', password: 'dkush22'

nfl_data_monday = JSON.parse(response_monday)

nfl_data_monday["dailyplayerstats"]["playerstatsentry"].each do |item|
nflPlayerMonday = NflAthlete.find_by(name: item["player"]["FirstName"] + " " + item["player"]["LastName"])
if nflPlayerMonday
nflPlayerMonday.update(week_seven: ((item["stats"]["PassYards"]["#text"].to_f * 0.04).to_f + (item["stats"]["PassTD"]["#text"].to_f * 4).to_f + (item["stats"]["RushYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RushTD"]["#text"].to_f * 6).to_f + (item["stats"]["RecYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RecTD"]["#text"].to_f * 6)))	
nflPlayerMonday.save
end
end
end

def self.weekly_stats_eight
response_thursday = RestClient::Request.execute method: :get, url: 'https://api.mysportsfeeds.com/v1.1/pull/nfl/2017-regular/daily_player_stats.json?fordate=20171026&playerstats=Att,Comp,Yds,TD&position=qb,rb,wr,te', user: 'dkush22', password: 'dkush22'

nfl_data_thursday = JSON.parse(response_thursday)

nfl_data_thursday["dailyplayerstats"]["playerstatsentry"].each do |item|
nflPlayerThursday = NflAthlete.find_by(name: item["player"]["FirstName"] + " " + item["player"]["LastName"])
if nflPlayerThursday
nflPlayerThursday.update(week_eight: ((item["stats"]["PassYards"]["#text"].to_f * 0.04).to_f + (item["stats"]["PassTD"]["#text"].to_f * 4).to_f + (item["stats"]["RushYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RushTD"]["#text"].to_f * 6).to_f + (item["stats"]["RecYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RecTD"]["#text"].to_f * 6)))	
nflPlayerThursday.save
end
end

response_sunday = RestClient::Request.execute method: :get, url: 'https://api.mysportsfeeds.com/v1.1/pull/nfl/2017-regular/daily_player_stats.json?fordate=20171029&playerstats=Att,Comp,Yds,TD&position=qb,rb,wr,te', user: 'dkush22', password: 'dkush22'

nfl_data_sunday = JSON.parse(response_sunday)

nfl_data_sunday["dailyplayerstats"]["playerstatsentry"].each do |item|
nflPlayerSunday = NflAthlete.find_by(name: item["player"]["FirstName"] + " " + item["player"]["LastName"])
if nflPlayerSunday
nflPlayerSunday.update(week_eight: ((item["stats"]["PassYards"]["#text"].to_f * 0.04).to_f + (item["stats"]["PassTD"]["#text"].to_f * 4).to_f + (item["stats"]["RushYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RushTD"]["#text"].to_f * 6).to_f + (item["stats"]["RecYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RecTD"]["#text"].to_f * 6)))	
nflPlayerSunday.save
end
end

response_monday = RestClient::Request.execute method: :get, url: 'https://api.mysportsfeeds.com/v1.1/pull/nfl/2017-regular/daily_player_stats.json?fordate=20171030&playerstats=Att,Comp,Yds,TD&position=qb,rb,wr,te', user: 'dkush22', password: 'dkush22'

nfl_data_monday = JSON.parse(response_monday)

nfl_data_monday["dailyplayerstats"]["playerstatsentry"].each do |item|
nflPlayerMonday = NflAthlete.find_by(name: item["player"]["FirstName"] + " " + item["player"]["LastName"])
if nflPlayerMonday
nflPlayerMonday.update(week_eight: ((item["stats"]["PassYards"]["#text"].to_f * 0.04).to_f + (item["stats"]["PassTD"]["#text"].to_f * 4).to_f + (item["stats"]["RushYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RushTD"]["#text"].to_f * 6).to_f + (item["stats"]["RecYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RecTD"]["#text"].to_f * 6)))	
nflPlayerMonday.save
end
end
end

def self.weekly_stats_nine
response_thursday = RestClient::Request.execute method: :get, url: 'https://api.mysportsfeeds.com/v1.1/pull/nfl/2017-regular/daily_player_stats.json?fordate=20171102&playerstats=Att,Comp,Yds,TD&position=qb,rb,wr,te', user: 'dkush22', password: 'dkush22'

nfl_data_thursday = JSON.parse(response_thursday)

nfl_data_thursday["dailyplayerstats"]["playerstatsentry"].each do |item|
nflPlayerThursday = NflAthlete.find_by(name: item["player"]["FirstName"] + " " + item["player"]["LastName"])
if nflPlayerThursday
nflPlayerThursday.update(week_nine: ((item["stats"]["PassYards"]["#text"].to_f * 0.04).to_f + (item["stats"]["PassTD"]["#text"].to_f * 4).to_f + (item["stats"]["RushYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RushTD"]["#text"].to_f * 6).to_f + (item["stats"]["RecYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RecTD"]["#text"].to_f * 6)))	
nflPlayerThursday.save
end
end

response_sunday = RestClient::Request.execute method: :get, url: 'https://api.mysportsfeeds.com/v1.1/pull/nfl/2017-regular/daily_player_stats.json?fordate=20171105&playerstats=Att,Comp,Yds,TD&position=qb,rb,wr,te', user: 'dkush22', password: 'dkush22'

nfl_data_sunday = JSON.parse(response_sunday)

nfl_data_sunday["dailyplayerstats"]["playerstatsentry"].each do |item|
nflPlayerSunday = NflAthlete.find_by(name: item["player"]["FirstName"] + " " + item["player"]["LastName"])
if nflPlayerSunday
nflPlayerSunday.update(week_nine: ((item["stats"]["PassYards"]["#text"].to_f * 0.04).to_f + (item["stats"]["PassTD"]["#text"].to_f * 4).to_f + (item["stats"]["RushYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RushTD"]["#text"].to_f * 6).to_f + (item["stats"]["RecYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RecTD"]["#text"].to_f * 6)))	
nflPlayerSunday.save
end
end

response_monday = RestClient::Request.execute method: :get, url: 'https://api.mysportsfeeds.com/v1.1/pull/nfl/2017-regular/daily_player_stats.json?fordate=20171106&playerstats=Att,Comp,Yds,TD&position=qb,rb,wr,te', user: 'dkush22', password: 'dkush22'

nfl_data_monday = JSON.parse(response_monday)

nfl_data_monday["dailyplayerstats"]["playerstatsentry"].each do |item|
nflPlayerMonday = NflAthlete.find_by(name: item["player"]["FirstName"] + " " + item["player"]["LastName"])
if nflPlayerMonday
nflPlayerMonday.update(week_nine: ((item["stats"]["PassYards"]["#text"].to_f * 0.04).to_f + (item["stats"]["PassTD"]["#text"].to_f * 4).to_f + (item["stats"]["RushYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RushTD"]["#text"].to_f * 6).to_f + (item["stats"]["RecYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RecTD"]["#text"].to_f * 6)))	
nflPlayerMonday.save
end
end
end

def self.weekly_stats_ten
response_thursday = RestClient::Request.execute method: :get, url: 'https://api.mysportsfeeds.com/v1.1/pull/nfl/2017-regular/daily_player_stats.json?fordate=20171109&playerstats=Att,Comp,Yds,TD&position=qb,rb,wr,te', user: 'dkush22', password: 'dkush22'

nfl_data_thursday = JSON.parse(response_thursday)

nfl_data_thursday["dailyplayerstats"]["playerstatsentry"].each do |item|
nflPlayerThursday = NflAthlete.find_by(name: item["player"]["FirstName"] + " " + item["player"]["LastName"])
if nflPlayerThursday
nflPlayerThursday.update(week_ten: ((item["stats"]["PassYards"]["#text"].to_f * 0.04).to_f + (item["stats"]["PassTD"]["#text"].to_f * 4).to_f + (item["stats"]["RushYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RushTD"]["#text"].to_f * 6).to_f + (item["stats"]["RecYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RecTD"]["#text"].to_f * 6)))	
nflPlayerThursday.save
end
end

response_sunday = RestClient::Request.execute method: :get, url: 'https://api.mysportsfeeds.com/v1.1/pull/nfl/2017-regular/daily_player_stats.json?fordate=20171112&playerstats=Att,Comp,Yds,TD&position=qb,rb,wr,te', user: 'dkush22', password: 'dkush22'

nfl_data_sunday = JSON.parse(response_sunday)

nfl_data_sunday["dailyplayerstats"]["playerstatsentry"].each do |item|
nflPlayerSunday = NflAthlete.find_by(name: item["player"]["FirstName"] + " " + item["player"]["LastName"])
if nflPlayerSunday
nflPlayerSunday.update(week_ten: ((item["stats"]["PassYards"]["#text"].to_f * 0.04).to_f + (item["stats"]["PassTD"]["#text"].to_f * 4).to_f + (item["stats"]["RushYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RushTD"]["#text"].to_f * 6).to_f + (item["stats"]["RecYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RecTD"]["#text"].to_f * 6)))	
nflPlayerSunday.save
end
end

response_monday = RestClient::Request.execute method: :get, url: 'https://api.mysportsfeeds.com/v1.1/pull/nfl/2017-regular/daily_player_stats.json?fordate=20171113&playerstats=Att,Comp,Yds,TD&position=qb,rb,wr,te', user: 'dkush22', password: 'dkush22'

nfl_data_monday = JSON.parse(response_monday)

nfl_data_monday["dailyplayerstats"]["playerstatsentry"].each do |item|
nflPlayerMonday = NflAthlete.find_by(name: item["player"]["FirstName"] + " " + item["player"]["LastName"])
if nflPlayerMonday
nflPlayerMonday.update(week_ten: ((item["stats"]["PassYards"]["#text"].to_f * 0.04).to_f + (item["stats"]["PassTD"]["#text"].to_f * 4).to_f + (item["stats"]["RushYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RushTD"]["#text"].to_f * 6).to_f + (item["stats"]["RecYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RecTD"]["#text"].to_f * 6)))	
nflPlayerMonday.save
end
end
end

def self.weekly_stats_eleven
response_thursday = RestClient::Request.execute method: :get, url: 'https://api.mysportsfeeds.com/v1.1/pull/nfl/2017-regular/daily_player_stats.json?fordate=20171116&playerstats=Att,Comp,Yds,TD&position=qb,rb,wr,te', user: 'dkush22', password: 'dkush22'

nfl_data_thursday = JSON.parse(response_thursday)

nfl_data_thursday["dailyplayerstats"]["playerstatsentry"].each do |item|
nflPlayerThursday = NflAthlete.find_by(name: item["player"]["FirstName"] + " " + item["player"]["LastName"])
if nflPlayerThursday
nflPlayerThursday.update(week_eleven: ((item["stats"]["PassYards"]["#text"].to_f * 0.04).to_f + (item["stats"]["PassTD"]["#text"].to_f * 4).to_f + (item["stats"]["RushYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RushTD"]["#text"].to_f * 6).to_f + (item["stats"]["RecYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RecTD"]["#text"].to_f * 6)))	
nflPlayerThursday.save
end
end

response_sunday = RestClient::Request.execute method: :get, url: 'https://api.mysportsfeeds.com/v1.1/pull/nfl/2017-regular/daily_player_stats.json?fordate=20171118&playerstats=Att,Comp,Yds,TD&position=qb,rb,wr,te', user: 'dkush22', password: 'dkush22'

nfl_data_sunday = JSON.parse(response_sunday)

nfl_data_sunday["dailyplayerstats"]["playerstatsentry"].each do |item|
nflPlayerSunday = NflAthlete.find_by(name: item["player"]["FirstName"] + " " + item["player"]["LastName"])
if nflPlayerSunday
nflPlayerSunday.update(week_eleven: ((item["stats"]["PassYards"]["#text"].to_f * 0.04).to_f + (item["stats"]["PassTD"]["#text"].to_f * 4).to_f + (item["stats"]["RushYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RushTD"]["#text"].to_f * 6).to_f + (item["stats"]["RecYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RecTD"]["#text"].to_f * 6)))	
nflPlayerSunday.save
end
end

response_monday = RestClient::Request.execute method: :get, url: 'https://api.mysportsfeeds.com/v1.1/pull/nfl/2017-regular/daily_player_stats.json?fordate=20171119&playerstats=Att,Comp,Yds,TD&position=qb,rb,wr,te', user: 'dkush22', password: 'dkush22'

nfl_data_monday = JSON.parse(response_monday)

nfl_data_monday["dailyplayerstats"]["playerstatsentry"].each do |item|
nflPlayerMonday = NflAthlete.find_by(name: item["player"]["FirstName"] + " " + item["player"]["LastName"])
if nflPlayerMonday
nflPlayerMonday.update(week_eleven: ((item["stats"]["PassYards"]["#text"].to_f * 0.04).to_f + (item["stats"]["PassTD"]["#text"].to_f * 4).to_f + (item["stats"]["RushYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RushTD"]["#text"].to_f * 6).to_f + (item["stats"]["RecYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RecTD"]["#text"].to_f * 6)))	
nflPlayerMonday.save
end
end
end

def self.weekly_stats_twelve
response_thursday = RestClient::Request.execute method: :get, url: 'https://api.mysportsfeeds.com/v1.1/pull/nfl/2017-regular/daily_player_stats.json?fordate=20171123&playerstats=Att,Comp,Yds,TD&position=qb,rb,wr,te', user: 'dkush22', password: 'dkush22'

nfl_data_thursday = JSON.parse(response_thursday)

nfl_data_thursday["dailyplayerstats"]["playerstatsentry"].each do |item|
nflPlayerThursday = NflAthlete.find_by(name: item["player"]["FirstName"] + " " + item["player"]["LastName"])
if nflPlayerThursday
nflPlayerThursday.update(week_twelve: ((item["stats"]["PassYards"]["#text"].to_f * 0.04).to_f + (item["stats"]["PassTD"]["#text"].to_f * 4).to_f + (item["stats"]["RushYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RushTD"]["#text"].to_f * 6).to_f + (item["stats"]["RecYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RecTD"]["#text"].to_f * 6)))	
nflPlayerThursday.save
end
end

response_sunday = RestClient::Request.execute method: :get, url: 'https://api.mysportsfeeds.com/v1.1/pull/nfl/2017-regular/daily_player_stats.json?fordate=20171125&playerstats=Att,Comp,Yds,TD&position=qb,rb,wr,te', user: 'dkush22', password: 'dkush22'

nfl_data_sunday = JSON.parse(response_sunday)

nfl_data_sunday["dailyplayerstats"]["playerstatsentry"].each do |item|
nflPlayerSunday = NflAthlete.find_by(name: item["player"]["FirstName"] + " " + item["player"]["LastName"])
if nflPlayerSunday
nflPlayerSunday.update(week_twelve: ((item["stats"]["PassYards"]["#text"].to_f * 0.04).to_f + (item["stats"]["PassTD"]["#text"].to_f * 4).to_f + (item["stats"]["RushYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RushTD"]["#text"].to_f * 6).to_f + (item["stats"]["RecYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RecTD"]["#text"].to_f * 6)))	
nflPlayerSunday.save
end
end

response_monday = RestClient::Request.execute method: :get, url: 'https://api.mysportsfeeds.com/v1.1/pull/nfl/2017-regular/daily_player_stats.json?fordate=20171126&playerstats=Att,Comp,Yds,TD&position=qb,rb,wr,te', user: 'dkush22', password: 'dkush22'

nfl_data_monday = JSON.parse(response_monday)

nfl_data_monday["dailyplayerstats"]["playerstatsentry"].each do |item|
nflPlayerMonday = NflAthlete.find_by(name: item["player"]["FirstName"] + " " + item["player"]["LastName"])
if nflPlayerMonday
nflPlayerMonday.update(week_twelve: ((item["stats"]["PassYards"]["#text"].to_f * 0.04).to_f + (item["stats"]["PassTD"]["#text"].to_f * 4).to_f + (item["stats"]["RushYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RushTD"]["#text"].to_f * 6).to_f + (item["stats"]["RecYards"]["#text"].to_f * 0.1).to_f + (item["stats"]["RecTD"]["#text"].to_f * 6)))	
nflPlayerMonday.save
end
end
end


end
