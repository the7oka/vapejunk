class ProfileController < ApplicationController
		before_action :authenticate_user!, :except => [:show]
	def index
		if current_user.admin == true
			@title = 'All users'
			@users = User.all.paginate(:page => params[:page], :per_page => 20).order('id DESC')
		end
	end
	def show
		@user = User.find(params[:id])
		@title = @user.display_name.humanize+'s Profile'
	end
	def edit
		@user = current_user
		@profile = current_user
	end
	def update 
		@profile = current_user
		if @profile.update(profile_params)
			redirect_to profile_path(@profile)
		else
			render 'edit'
		end
	end
	def mine
		if user_signed_in?
			redirect_to profile_path(current_user)
		else 
			redirect_to '/users/sign_up'
		end
	end
	private
	def profile_params
		params.require(:user).permit(:username,:first_name,:last_name,:gender,:avatar,:email,:location)
	end
end
