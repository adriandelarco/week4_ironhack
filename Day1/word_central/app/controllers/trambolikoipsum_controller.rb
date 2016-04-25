class TrambolikoipsumController < ApplicationController
	def new
		render 'new'
	end
	def create
		@array_tramboliko = [
			" Tábamos tomando tranquilamente ahí en la jurisdicción del surtidor
			y yo le dije justamente: vamos ya a irnos a casa, yo le dije es hora
			para ir a descansar, mañana es día de laburar."],[
			" Cuando justamente el personaje me dijo: vamos a irnos, pero vamos a irnos como yo quiero, me dijo.
			 Y comenzó a acelerar, y vino a toda velocidad."],[
			" Esta pendiente es un poco... trambolika."],[
			" Hay que saber subir y bajar."],[
			" Y quizo pasar en un sesenta entre ochenta kilómetros por hora... y voló."],[
			" Y me hizo volar. Y yo volé de él, pero vole de él por acá, por la arbolada."],[
			" Y el voló y se estrelló por la pared, y se reventó todito, y su moto se fue a la puta."],[
			" Y... yo gracias a Dios, estoy bien. Y él, esta ahí, no se como... pero, quiero que se mejore."
		]
		@type = params[:tramboliko][:type]
		number = params[:tramboliko][:quantity].to_i
		if @type == 'paragraphs'
			@results = []
			number.times do |_i|
				paragraph = ""
				7.times do |_i|
					paragraph += @array_tramboliko[rand(7)][0]
				end
				@results.push (paragraph)
			end
		elsif @type == 'words'
			@results = ""
			number.times do |i|
				array_words = @array_tramboliko[rand(7)][0].split(' ')
				@results += array_words[rand(array_words.length)].to_s + " "
			end
		end
		render 'results'
	end
end