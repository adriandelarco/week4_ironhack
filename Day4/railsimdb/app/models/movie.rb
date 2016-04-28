class Movie < ActiveRecord::Base
	has_many :comments
	def self.find_movies(keyword)
		if where("title like?", "%#{keyword}%").take.present?
			[where("title like?", "%#{keyword}%").take, "db"]
		else
			[movies_imdb = ImdbDatum.search(keyword, 5), "imdb"]
		end
	end
end
