class ContactsController < ApplicationController
	def index
		params[:search] ? @contacts = Contact.where("name like?", "#{params[:search]}%") : @contacts = Contact.order(name: :asc);
		@search = params[:search]
		render 'index'
	end
	def new
		@contact = Contact.new
	end
	def create
		@contact = Contact.new contact_params
		if @contact.save
			redirect_to '/contacts'
		else
			render 'new'
			flash[:error] = @contact.errors.full_messages
		end
	end
	def show
		user_id = params[:id]
		@contact = Contact.find_by(id: user_id)
		render 'show'
	end
	def fav
		user_id = params[:id]
		contact = Contact.find_by(id: user_id)
		contact.make_favorite(contact)
		redirect_to('/contacts')
	end
	def favorites
		@favorite_users = Contact.where("favorite = ?", true)
		render 'favorites'
	end
	def search_beginning_with
		search_results = params[:search][:beginning_with]
		redirect_to controller: 'contacts', search: search_results
	end

	private
	def contact_params
	  params.require(:contact).permit(:name,:email_address,:phone, :address, :avatar)
	end
end
