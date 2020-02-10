class BrewsController < ApplicationController
  before_action :set_brew, only: [:show, :edit, :update, :destroy]
  before_action :set_beer, only: [:new, :create]

  def new
    # @brew = Brew.new
    @brew = @beer.brews.build
  end

  def create
    @brew = Brew.new(brew_params)
    # @brew.beer = @beer
    @brew.user = current_user

    respond_to do |format|
      # raise
      if @brew.save
        format.html { redirect_to brew_path(@brew), notice: 'Brew was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def index
    @user = current_user
    @brews = Brew.where(user_id: @user.id)
  end

  def show
    @brew_steps = BrewStep.where(brew_id: @brew.id)
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
      format.html { redirect_to root_path, notice: 'Brew was successfully destroyed.' }
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
    params.require(:brew).permit(:user_id, :beer_id, :ispindle_id)
  end
end
