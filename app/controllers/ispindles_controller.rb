class IspindlesController < ApplicationController

  before_action :set_ispindle, only: [:show, :edit, :update, :destroy, :parametrage]
  before_action :set_brew, only: [:new, :create, :index]

  def new
    # @ispindle = ispindle.new
    @ispindle = @brew.ispindles.build
  end

  def create
    @ispindle = Ispindle.new(ispindle_params)
    @ispindle.brew = @brew

    respond_to do |format|
      # raise
      if @ispindle.save
        format.html { redirect_to ispindle_path(@ispindle), notice: 'ispindle was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def index
    @ispindles = Ispindle.where(brew_id: @brew.id)
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @ispindle.update(ispindle_params)
        format.html { redirect_to ispindle_path(@ispindle), notice: 'ispindle was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @ispindle.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'ispindle was successfully destroyed.' }
    end
  end

  def parametrage
    @brew = Brew.find(params[:id])
  end

  def create_ispindle
    @ispindle = Ispindle.new
    @brew = Brew.find(params[:mbrew].to_i)
    @beer = @brew.beer
    @ispindle.temperature = params[:mtemp].to_f
    @ispindle.density = params[:mdens].to_f
    date = params[:mdate]
    @ispindle.created_at = DateTime.strptime(date,'%s')
    @ispindle.name = params[:mname]
    @ispindle.brew = @brew
    # @ispindle.beer = @beer
    respond_to do |format|
      if @ispindle.save
        format.html { redirect_to brew_ispindles_path(@brew), notice: 'ispindle was successfully created.' }
      else
        format.html { redirect_to brew_ispindles_path(@brew), notice: 'ispindle can not be created.' }
      end
    end
    # raise
  end

  private

  def set_brew
    @brew = Brew.find(params[:brew_id])
    @user = User.all
  end

  def set_ispindle
    @ispindle = Ispindle.find(params[:id])
  end

  def ispindle_params
    params.require(:ispindle).permit(:name, :temperature, :density, :brew_id)
  end
end
