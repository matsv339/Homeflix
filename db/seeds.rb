# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


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

User.create(username:"matsv339", password:"123")
User.create(username:"admin", password:"admin")

Favorit.create(user_id:"1", imdb_id:"tt0110912")
Favorit.create(user_id:"1", imdb_id:"tt0068646")
Favorit.create(user_id:"2", imdb_id:"tt0111161")
Favorit.create(user_id:"2", imdb_id:"tt0110912")
Favorit.create(user_id:"2", imdb_id:"tt0068646")



# Movie.create(user_id:"1", imdb_id:"tt0110912") #Pulp Fiction
# User.create(username:"aaa", password:"bbb")