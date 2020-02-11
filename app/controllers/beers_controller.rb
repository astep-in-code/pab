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
    recipe = @beer.recipe
    @recipe_parse = JSON.parse(recipe)
    # @collect = []
    # @recipe_parse.each do |recipe|
    #   @collect << recipe
    # end
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


