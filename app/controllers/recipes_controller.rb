class RecipesController < ApplicationController
    def show
        id = params[:id]
        @recipe = Recipe.find(id)
    end 

    def new

    end

    def create 
        # receber dados do formulário
        recipe_params = params.require(:recipe).permit(:title, :recipe_type, :cuisine, :difficulty,
                                                       :cook_time, :ingredients, :cook_method)
                                            
        # criar a receita em si
        recipe = Recipe.create(recipe_params)

        # redirecionar para a receita recém criada.
        redirect_to recipe_path recipe.id
    end 
end