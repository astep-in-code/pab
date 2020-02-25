class IspindlesController < ApplicationController
  protect_from_forgery except: [:new, :create_ispindle]
  before_action :set_ispindle, only: [:show, :edit, :update, :destroy]
  before_action :set_brew, only: [:new, :create, :index]
  require 'json'
  require 'open-uri'

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
    @beer = @brew.beer
    @title = "Mon brassin : <br />#{@brew.beer.name}"
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
    @ispindles = Ispindle.where(brew_id: @brew.id)
    @beer = @brew.beer
  end

  def send_to_DB
    @ispindle = Ispindle.new
    @brew = Brew.find(params[:mnum].to_i)
    @beer = @brew.beer
    @inputNameApp = params[:mname]
    @tokenSearch = params[:mtoken]
    @inputSearchTemperature = 'temperature'
    @inputSearchDensity = 'gravity'

    urlt = "https://things.ubidots.com/api/v1.6/devices/#{@inputNameApp}/#{@inputSearchTemperature}/values/?token=#{@tokenSearch}";
    serialized_urlt = open(urlt).read
    data_t = JSON.parse(serialized_urlt)

    urld = "https://things.ubidots.com/api/v1.6/devices/#{@inputNameApp}/#{@inputSearchDensity}/values/?token=#{@tokenSearch}";
    serialized_urld = open(urld).read
    data_d = JSON.parse(serialized_urld)
    length = data_t["results"].length

    raise
    i = 0
    while i < length
      @ispindle.name = @inputNameApp
      @ispindle.temperature = data_t["results"][i]["value"]
      @ispindle.density = data_d["results"][i]["value"]
      @ispindle.brew = @brew
      @ispindle.save!
      date = data_t["results"][i]["timestamp"]
      date = date.to_i / 1000
      date = DateTime.strptime(date.to_s,'%s')
      @ispindle.update(created_at: date)
    end

    # raise
  end

  def destroy_all_ispindle
    @brew = Brew.find(params[:id])
    @ispindles = Ispindle.where(brew_id: @brew.id)
    @ispindles.each do |i|
      i.destroy
    end

    redirect_to parametrage_path(@brew)
  end

  def create_ispindle
    # Ispindle.destroy_all => à prevoir
    # Ispindle.destroy_all
    @ispindle = Ispindle.new
    @brew = Brew.find(params[:mbrew].to_i)
    @beer = @brew.beer
    # raise
    @ispindle.temperature = params[:mtemp].to_f
    @ispindle.density = params[:mdens].to_f
    date = params[:mdate].to_i / 1000
    @ispindle.created_at = DateTime.strptime(date.to_s,'%s')
    @ispindle.name = params[:mname]
    @ispindle.brew = @brew
    # raise
    # @ispindle.beer = @beer
    respond_to do |format|
      if @ispindle.save
        format.html { redirect_to parametrage_path(@brew), notice: 'Datas was successfully created.' }
      else
        format.html { redirect_to parametrage_path(@brew), notice: 'Datas can not be created.' }
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
