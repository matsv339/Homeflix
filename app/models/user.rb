class User < ActiveRecord::Base
	# has_many :favorits
	has_many :comments
end
