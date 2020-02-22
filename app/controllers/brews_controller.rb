class BrewsController < ApplicationController
  before_action :set_brew, only: [:show, :edit, :update, :destroy]
  before_action :set_beer, only: [:new, :create]
  require 'json'


  # def new
  #   # @brew = Brew.new
  #   @brew = @beer.brews.build
  # end

  def create
    @brew = Brew.new
    # @beer = Beer.find(params[:id])
    @brew.beer = @beer
    @brew.user = current_user
      # raise
    @brew.save!

    @brew_step = BrewStep.new
    @brew_step.status = 0
    @brew_step.brew = @brew
    @brew_step.beer_step_id = 1
    @brew_step.save!
    # raise
    redirect_to brews_path
  end

  def index
    @user = current_user
    @brews = Brew.where(user_id: @user.id)
    @title = "Mes brassins"
  end

  def show
    # @brew_steps = BrewStep.all
    @brew_steps = BrewStep.where(brew_id: @brew.id)

    @beer_sub_step = BeerSubStep.where(beer_id: @brew.beer.id)

    sub_step = @beer_sub_step[0].sub_step
    @hash_sub_step = JSON.parse(sub_step, symbolize_keys: true)
    @hash_sub_step.deep_symbolize_keys!
    @title = "Mon brassin : #{@brew.beer.name}"
  end

  def edit
  end

  def update
    respond_to do |format|
      if @brew.update(brew_params)
        format.html { redirect_to brew_path(@brew), notice: 'Brew was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @brew.destroy
    respond_to do |format|
      format.html { redirect_to brews_path, notice: 'Brew was successfully destroyed.' }
    end
  end

  private

  def set_beer
    @beer = Beer.find(params[:beer_id])
  end

  def set_brew
    @brew = Brew.find(params[:id])
  end

  def brew_params
    params.require(:brew).permit(:user_id, :beer_id)
  end
end
