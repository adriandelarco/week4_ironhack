class TextinspectorController < ApplicationController
	def new
		render 'new'
	end
	def create
		@text = params[:text_inspection][:user_text]
    	@word_count = @text.split(" ").length
    	@time = @word_count.to_f / 275


		repeated = Hash.new(0)
		@text.split(" ").each { | word | repeated.store(word, repeated[word]+1)}
		repeated_ordered = repeated.sort_by {|_key, value| value}
		@repated_words = repeated_ordered.reverse[0..9]
		render "results"
	end
end