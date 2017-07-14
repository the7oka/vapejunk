class BuildsController < ApplicationController
	def new 
		if user_signed_in?
			@build = Build.new
		else 
			redirect_to "/users/sign_in"
		end
	end
	def create
		if user_signed_in?
			@build = current_user.builds.build(builds_params)
			if @build.save
				redirect_to '/profile/'+current_user.id.to_s
			end
		else 
			redirect_to "/users/sign_in"
		end
	end
	def mybuilds
		@builds = current_user.builds
	end
	def destroy
		@build = Build.find(params[:id])
		@user = @build.user
		@build.destroy
		redirect_to '/profile/'+@user.id.to_s
	end
	private
	def builds_params
		params.require(:build).permit(:name , :avatar, :tank, :wire, :cotton)
	end
end
