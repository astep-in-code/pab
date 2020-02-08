class BrewStepsController < ApplicationController
before_action :set_brewstep, only: [:show, :edit, :update, :destroy]

  def new
    @brewstep = Brewstep.new
  end

  def create
    @brewstep = Brewstep.new(brewstep_params)
    respond_to do |format|
      # raise
      if @brewstep.save
        format.html { redirect_to brewstep_path(@brewstep), notice: 'Brewstep was successfully created.' }
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
      if @brewstep.update(brewstep_params)
        format.html { redirect_to brewstep_path(@beerstep), notice: 'Brewstep was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @brewstep.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Brewstep was successfully destroyed.' }
    end
  end

  private

  def set_brewstep
    @brewstep = Brewstep.find(params[:id])
  end

  def brewstep_params
    # params.require(:brewstep).permit(:sub_step, :step, :description)
  end
end
