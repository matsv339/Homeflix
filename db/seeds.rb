# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'net/http'
require 'json'

# Adds the movies to the db
Movie.create(imdb_id:"tt0110912") #Pulp Fiction
Movie.create(imdb_id:"tt0068646") #Gudfadern
Movie.create(imdb_id:"tt0111161") #Shawshank
Movie.create(imdb_id:"tt0468569") #The dark knight
Movie.create(imdb_id:"tt0060196") #Den onde...
Movie.create(imdb_id:"tt0108052") #Shindler
Movie.create(imdb_id:"tt0050083") #12 Eds..
Movie.create(imdb_id:"tt0167260") #LOTR
Movie.create(imdb_id:"tt0137523") #Fight C
Movie.create(imdb_id:"tt0080684") #Star wars
Movie.create(imdb_id:"tt0109830") #Forest Gump
Movie.create(imdb_id:"tt0317248") #City of god
Movie.create(imdb_id:"tt1229340") #Anchorman II

# Extend each movie with data from imdb
movies = Movie.all
count = 0
movies.each do |item|
	result = JSON.parse(Net::HTTP.get(URI.parse('http://www.omdbapi.com?i=' + item.imdb_id)))
	item.Title = result['Title']
	item.Year = result['Year']
	item.Rated = result['Rated']
	item.Released = result['Released']
	item.Runtime = result['Runtime']
	item.Genre = result['Genre']
	item.Director = result['Director']
	item.Writer = result['Writer']
	item.Actors = result['Actors']
	item.Plot = result['Plot']
	item.Language = result['Language']
	item.Country = result['Country']
	item.Awards = result['Awards']
	item.Poster = result['Poster']
	item.Metascore = result['Metascore']
	item.imdbRating = result['imdbRating']
	item.imdbVotes = result['imdbVotes']
	item.save
	puts "Moive added"
	count = count + 1
end
puts "Total movies added: " + count.to_s

User.create(username:"matsv339", password:"123")
User.create(username:"admin", password:"admin")

Favorit.create(user_id:"1", imdb_id:"tt0110912")
Favorit.create(user_id:"1", imdb_id:"tt0068646")
Favorit.create(user_id:"2", imdb_id:"tt0111161")
Favorit.create(user_id:"2", imdb_id:"tt0110912")
Favorit.create(user_id:"2", imdb_id:"tt0068646")



# Movie.create(user_id:"1", imdb_id:"tt0110912") #Pulp Fiction
# User.create(username:"aaa", password:"bbb")