class IspindlesController < ApplicationController
  before_action :set_ispindle, only: [:show, :edit, :update, :destroy]
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

  private

  def set_brew
    @brew = Brew.find(params[:brew_id])
    @user = User.all
  end

  def set_ispindle
    @ispindle = Ispindle.find(params[:id])
  end

  def ispindle_params
    params.require(:ispindle).permit(:name, :temperature, :density, :brew_id, :brew_id)
  end
end
