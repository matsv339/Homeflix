class CreateRatings < ActiveRecord::Migration
  	def change
    	create_table :ratings do |t|
    		t.string :user_id
    		t.string :imdb_id
    		t.integer :rating

      		t.timestamps
    	end
  	end
end
