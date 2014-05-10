class CreateMovies < ActiveRecord::Migration
  	def change
    	create_table :movies do |t|
    		t.string :imdb_id
    		t.string :Title
    		t.string :Year
    		t.string :Rated
    		t.string :Released
    		t.string :Runtime
    		t.string :Genre
    		t.string :Director
    		t.string :Writer
    		t.string :Actors
    		t.string :Plot
    		t.string :Language
    		t.string :Country
    		t.string :Awards
    		t.string :Poster
    		t.string :Metascore
    		t.string :imdbRating
    		t.string :imdbVotes

      		t.timestamps
    	end
  	end
end
