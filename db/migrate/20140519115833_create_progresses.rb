class CreateProgresses < ActiveRecord::Migration
  	def change
    	create_table :progresses do |t|
    		t.string :user_id
    		t.string :imdb_id
    		t.float :progress

      		t.timestamps
    	end
  	end
end
