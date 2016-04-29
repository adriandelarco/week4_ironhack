module ConcertsHelper
	def from_today_to(model, days)
		model.where(datetime: (Date.today..(Date.today + days.days)))
	end
	def search_by_price(model, price)
		model.where("price < ?", price)
	end
	def most_commented(model, number)
		hash = {}
		model.all.each do |concert|
			hash[concert.id] = concert.comments.count
		end
		most_commented = []
		hash.sort_by {|_key, value| value}[0..9].reverse.each do |key, value|
			most_commented.push(model.find(key.to_i))
		end
		most_commented
	end

end
