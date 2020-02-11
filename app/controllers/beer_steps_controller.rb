class BeerStepsController < ApplicationController
  before_action :set_beerstep, only: [:show, :edit, :update, :destroy]

  def new
    @beerstep = Beerstep.new
  end

  def create
    @beerstep = Beerstep.new(beerstep_params)
    respond_to do |format|
      # raise
      if @beerstep.save
        format.html { redirect_to beerstep_path(@beerstep), notice: 'Beerstep was successfully created.' }
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
      if @beerstep.update(beerstep_params)
        format.html { redirect_to beerstep_path(@beerstep), notice: 'Beerstep was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @beerstep.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Beerstep was successfully destroyed.' }
    end
  end

  private

  def set_beerstep
    @beerstep = Beerstep.find(params[:id])
  end

  def beerstep_params
    params.require(:beerstep).permit(:sub_step, :step, :description)
  end
end
