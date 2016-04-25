class AsciisController < ApplicationController
	def new
		render 'new'
	end
	def create
		text = params[:asciis][:user_text]
		artii = Artii::Base.new
		@ascii_text = artii.asciify(text)
		render 'results'
	end
end
