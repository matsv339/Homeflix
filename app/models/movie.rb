class Movie < ActiveRecord::Base
	# has_many :favorits

	def self.search(search)
		search_condition = "%" + search + "%"
		where("Title LIKE ? OR Actors LIKE ? OR Year LIKE ? OR Director LIKE ? OR Writer LIKE ? OR Genre LIKE ? OR imdb_id LIKE ?", search_condition, search_condition, search_condition, search_condition, search_condition, search_condition, search_condition).limit(5)
	end

	def self.genreSearch(search)
		search_condition = "%" + search + "%"
		where("Genre LIKE ?", search_condition)
	end
end
