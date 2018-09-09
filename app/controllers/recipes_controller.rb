class RecipesController < ApplicationController
    def show
        id = params[:id]
        @recipe = Recipe.find(id)
    end 

    def new
        @recipe = Recipe.new
    end

    def create 
        # receber dados do formulário
        recipe_params = params.require(:recipe).permit(:title, :recipe_type, :cuisine, :difficulty,
                                                       :cook_time, :ingredients, :cook_method)
                                            
        # criar a receita em si
        @recipe = Recipe.new(recipe_params)

        # redirecionar para a receita recém criada.
        if @recipe.save
            redirect_to recipe_path @recipe.id
        else
            render 'new'
        end 
    end 

    def edit
        id = params[:id]
        @recipe = Recipe.find(id)
    end

    def update 
        id = params[:id]
        @recipe = Recipe.find(id)

        recipe_params = params.require(:recipe).permit(:title, :recipe_type, :cuisine, :difficulty,
        :cook_time, :ingredients, :cook_method)

        if @recipe.update(recipe_params)
            redirect_to recipe_path @recipe
        else
            render 'edit'
        end 
    end 
end