class UsersController < ApplicationController
	def show
		debugger
		@user =User.find(current_user.id)
	end
end