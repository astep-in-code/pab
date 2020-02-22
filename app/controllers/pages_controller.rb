class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @beers = Beer.all
    @title = "Rechercher"
  end

  def profil
    @user = current_user
  end
end
