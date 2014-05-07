class CreateFavorits < ActiveRecord::Migration
  	def change
    	create_table :favorits do |t|
    		t.string :user_id
    		t.string :imdb_id

      		t.timestamps
    	end
  	end
end
