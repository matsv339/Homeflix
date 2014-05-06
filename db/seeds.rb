# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Movie.create(imdbID:"tt0110912") #Pulp Fiction
Movie.create(imdbID:"tt0068646") #Gudfadern
Movie.create(imdbID:"tt0111161") #Shawshank
Movie.create(imdbID:"tt0468569") #The dark knight
Movie.create(imdbID:"tt0060196") #Den onde...
Movie.create(imdbID:"tt0108052") #Shindler
Movie.create(imdbID:"tt0050083") #12 Eds..
Movie.create(imdbID:"tt0167260") #LOTR
Movie.create(imdbID:"tt0137523") #Fight C
Movie.create(imdbID:"tt0080684") #Star wars
Movie.create(imdbID:"tt0109830") #Forest Gump
Movie.create(imdbID:"tt0317248") #City of god
Movie.create(imdbID:"tt1229340") #Anchorman II

User.create(username:"matsv339", password:"123")
User.create(username:"admin", password:"admin")

Favorit.create(user_id:"1", movie_id:"3")
Favorit.create(user_id:"1", movie_id:"5")
Favorit.create(user_id:"2", movie_id:"3")
Favorit.create(user_id:"2", movie_id:"1")
Favorit.create(user_id:"2", movie_id:"7")



# Movie.create(user_id:"1", imdbID:"tt0110912") #Pulp Fiction
# User.create(username:"aaa", password:"bbb")