class BrewStepsController < ApplicationController

  before_action :set_brewstep, only: [:show, :edit, :update, :destroy]

  def dash
    @beerStep = BeerStep.all
    @brew = Brew.find(params[:id])
    @beer = @brew.beer
    @brew_step = BrewStep.where(brew_id: @brew.id)
    @brewSteps = BrewStep.all
    @beer_sub_step = BeerSubStep.where(beer_id: @brew.beer.id)
    @title = "Mon brassin : <br />#{@brew.beer.name}"
  end

  def update_step
    @brew = Brew.find(params[:id])
    @brew_step = BrewStep.where(brew_id: @brew.id)
    status = @brew_step[0].status += 1
    @brew_step[0].update(status: status)
    step = @brew_step[0].beer_step_id +=1
    @brew_step[0].update(beer_step_id: step)
    # @brew_step.save!

    redirect_to brew_path(@brew)
  end

  private

  def set_brewstep
    @brewstep = Brewstep.find(params[:id])
  end
end
