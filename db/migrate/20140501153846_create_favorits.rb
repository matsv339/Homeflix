class CreateFavorits < ActiveRecord::Migration
  	def change
    	create_table :favorits do |t|
    		t.belongs_to :user
    		t.belongs_to :movie

      		t.timestamps
    	end
  	end
end
