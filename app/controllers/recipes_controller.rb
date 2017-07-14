class RecipesController < ApplicationController
	def new 
		@recipe = Recipe.new
	end
	def show
		@recipe = Recipe.find(params[:id])
		if @recipe.user == current_user
			redirect_to "/recipes/"+@recipe.id.to_s+"/edit"
		end
	end
	def showrecipe
		@recipe = Recipe.find(params[:id])
	end
	def edit
		@recipe = Recipe.find(params[:id])
		if @recipe.user != current_user
			redirect_to "/recipes/"+@recipe.id.to_s
		end
	end
	def update
		if user_signed_in?
			@recipe = Recipe.find(params[:id])
			if @recipe.user != current_user
				redirect_to '/'
			else
				if @recipe.update(recipe_params)
					redirect_to "/myrecipes"
				end
			end
		else
			redirect_to "/users/sign_in"
		end
	end
	def create 
		if user_signed_in?
			@recipe = current_user.recipes.build(recipe_params)
			if @recipe.save
				redirect_to "/r"
			end
		else
			redirect_to "/users/sign_in"
		end
	end
	def myrecipes
		if user_signed_in?
			@recipes = current_user.recipes
		else
			redirect_to "/users/sign_in"
		end
	end
	def index
		@recipes = Recipe.order('created_at DESC').limit(10)
		@builds = Build.order('created_at DESC').limit(10)
	end
	def destroy
		@recipe = Recipe.find(params[:id])
		@user = @recipe.user
		@recipe.destroy
		redirect_to '/profile/'+@user.id.to_s
	end
	private 
	def recipe_params
		params.require(:recipe).permit(:name, :amount, :nic_strength, :nic_vg, :target_nic, :target_vg, :avatar, flavors_attributes: [:name, :percentage, :vg])
	end
end
