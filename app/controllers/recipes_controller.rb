class RecipesController < ApplicationController

    def index 
        user = User.find_by(id: session[:user_id])
        if user
            recipes = Recipe.all 
            render json: recipes
        else
            render json: { errors: ["You must be logged in"] }, status: :unauthorized
    end

    def create
        user = User.find_by(id: session[:user_id])
        if user
          @recipe = user.recipes.create(recipe_params)
    
          if @recipe.save
            render json: @recipe, status: :created, location: @recipe
          else
            render json: { errors: @recipe.errors.full_messages }, status: :unprocessable_entity
          end
    
        else
          render json: { errors: ["You must be logged in."] }, status: :unauthorized
        end
      end

    private 

    def recipe_params
        params.permit(:title, :instructions, :minutes_to_complete)
    end

end