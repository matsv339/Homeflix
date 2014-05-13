# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'net/http'
require 'json'

# Adds the movies to the db (49 st atm)
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
Movie.create(imdb_id:"tt1872181")
Movie.create(imdb_id:"tt2004420")
Movie.create(imdb_id:"tt1877832")
Movie.create(imdb_id:"tt0831387")
Movie.create(imdb_id:"tt2203939")
Movie.create(imdb_id:"tt1843866")
Movie.create(imdb_id:"tt1840309")
Movie.create(imdb_id:"tt1921064")
Movie.create(imdb_id:"tt2294629")
Movie.create(imdb_id:"tt1587310")
Movie.create(imdb_id:"tt1291150")
Movie.create(imdb_id:"tt2395427")
Movie.create(imdb_id:"tt2463288")
Movie.create(imdb_id:"tt0948470")
Movie.create(imdb_id:"tt2557490")
Movie.create(imdb_id:"tt2177771")
Movie.create(imdb_id:"tt1234721")
Movie.create(imdb_id:"tt2582846")
Movie.create(imdb_id:"tt2103281")
Movie.create(imdb_id:"tt2278388")
Movie.create(imdb_id:"tt0993846")
Movie.create(imdb_id:"tt1723121")
Movie.create(imdb_id:"tt1800246")
Movie.create(imdb_id:"tt1430612")
Movie.create(imdb_id:"tt1798709")
Movie.create(imdb_id:"tt2015381")
Movie.create(imdb_id:"tt1937390")
Movie.create(imdb_id:"tt3014666")
Movie.create(imdb_id:"tt2357291")
Movie.create(imdb_id:"tt1170358")
Movie.create(imdb_id:"tt1959490")
Movie.create(imdb_id:"tt1929263")
Movie.create(imdb_id:"tt2333784")
Movie.create(imdb_id:"tt1800241")
Movie.create(imdb_id:"tt1086772")
Movie.create(imdb_id:"tt1951264")

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

# User.create(username:"Mattias", password:"123")
# User.create(username:"Gustav", password:"321")
# User.create(username:"Erik", password:"231")

Favorit.create(user_id:"1", imdb_id:"tt0110912")
Favorit.create(user_id:"1", imdb_id:"tt0068646")
# Favorit.create(user_id:"2", imdb_id:"tt0111161")
# Favorit.create(user_id:"2", imdb_id:"tt0110912")
# Favorit.create(user_id:"2", imdb_id:"tt0068646")

Comment.create(user_id:"1", imdb_id:"tt0110912", content:"This is a comment.")
Comment.create(user_id:"1", imdb_id:"tt0110912", content:"This is a second comment.")
# Comment.create(user_id:"2", imdb_id:"tt0110912", content:"Guess what?")
# Comment.create(user_id:"2", imdb_id:"tt0068646", content:"New movie.")