class BeersController < ApplicationController
  before_action :set_beer, only: [:show, :edit, :update, :destroy]
  require 'json'

  def new
    @beer = Beer.new
  end

  def create
    @beer = Beer.new(beer_params)
    respond_to do |format|
      # raise
      if @beer.save
        format.html { redirect_to beer_path(@beer), notice: 'Beer was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def show
    @brew = Brew.new
    recipe = @beer.recipe
    @hash_recipe = JSON.parse(recipe, symbolize_keys: true)
    @hash_recipe.deep_symbolize_keys!

    # ingredients
    @hash_ingredients = @hash_recipe[:preparation][:ingredients]

    # nettoyage
    @hash_nettoyage = @hash_recipe[:preparation][:nettoyage]

    # empatage
    @hash_empatage = @hash_recipe[:Empâtage]

    # ebullition
    @hash_ebullition = @hash_recipe[:Ebullition]

    # fermentation
    @hash_fermentation = @hash_recipe[:Fermentation]

    # embouteillage
    @hash_embouteillage = @hash_recipe[:Embouteillage]

    @title = "Recette : #{@beer.name}"
  end

  def edit
  end

  def update
    respond_to do |format|
      if @beer.update(beer_params)
        format.html { redirect_to beer_path(@beer), notice: 'Beer was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @beer.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Beer was successfully destroyed.' }
    end
  end

  private

  def set_beer
    @beer = Beer.find(params[:id])
  end

  def beer_params
    params.require(:beer).permit(:style, :volume, :fermentation, :color, :bitterness, :bitterness_ratio, :alcohol, :description, :recipe, :name, :initial_density_target, :final_density_target, :fermentation_temperature_target)
  end
end
