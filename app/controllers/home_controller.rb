class HomeController < ApplicationController
    def welcome
        #@recipes = Recipe.all
        @featured_recipes = Recipe.where(featured: true)
        @other_recipes = Recipe.where(featured: false)  
    end 
end