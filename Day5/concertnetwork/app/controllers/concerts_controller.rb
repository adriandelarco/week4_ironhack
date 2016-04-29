class ConcertsController < ApplicationController
	helper :concerts
	def index
		@concerts = Concert.all
	end
	def search_by_price
		@concerts = Concert.all
		@price  = params[:search][:price]
		@method = "price"
		render :search
	end

	def new
		@concert = Concert.new
	end
	def create
		@concert = Concert.new concert_params
		if @concert.save
			redirect_to concerts_path
		else
			render new_concert_path
		end
	end
	def show
		@concert = Concert.find(params[:id])
		@comment = Comment.new
		@comments = @concert.comments.all
	end

	private
	def concert_params
	  params.require(:concert).permit(:artist,:venue,:city, :datetime, :price, :description, :avatar)
	end
end
