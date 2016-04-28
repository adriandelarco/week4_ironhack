class UsersController < ApplicationController
	def login
		nickname = params[:user][:nickname]
		password = params[:user][:password]
		@user = User.find_by(nickname: nickname).try
		if @user.password.try == password
			render plain: "yes"
		else
			render plain: "no"
		end
	end
end
