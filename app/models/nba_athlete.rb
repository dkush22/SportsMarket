class NbaAthlete < ApplicationRecord


def self.test
nba_players = RestClient.get('https://api.sportradar.us/nba/trial/v4/en/seasons/2017/REG/leaders.json?api_key=br8c8s4tdcgsjmxeyx8wczg5')
nba_data = JSON.parse(nba_players)
byebug
end


end
