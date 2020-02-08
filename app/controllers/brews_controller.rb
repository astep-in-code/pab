class BrewsController < ApplicationController
  before_action :set_brew, only: [:show, :edit, :update, :destroy]

  def new
    @brew = Brew.new
  end

  def create
    @brew = Brew.new(brew_params)
    respond_to do |format|
      # raise
      if @brew.save
        format.html { redirect_to brew_path(@brew), notice: 'Brew was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def show
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

  def set_brew
    @brew = Brew.find(params[:id])
  end

  def brew_params
    params.require(:brew).permit(:user_id, :beer_id, :ispindle_id)
  end
end
