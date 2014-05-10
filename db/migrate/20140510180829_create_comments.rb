class CreateComments < ActiveRecord::Migration
  	def change
    	create_table :comments do |t|
    		t.string :user_id
    		t.string :imdb_id
    		t.text :content

      		t.timestamps
    	end
  	end
end
