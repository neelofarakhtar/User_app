class ProfileController < ApplicationController
	def index
		@profile = current_user.profile rescue nil
	end

	def new
		@profile = Profile.new
	end

	def create
		@profile = current_user.build_profile(profile_params)
	    @profile.save
	    redirect_to profile_index_path(@profile.id)
	end

	def profile_params
		params.require(:profile).permit(:age,:mobile_number,:address,:user_id)
	end
end
