class ImdbDatum < ActiveRecord::Base
	def self.search(title, number)
	    Imdb::Search.new(title).movies[0..(number - 1)]
	    #search_data.size > 5 ? search_data : false
    end
end
