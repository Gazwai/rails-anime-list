class AnimesController < ApplicationController
  allow_unauthenticated_access only: [ :index ]

  def index
    @animes = Anime.all
  end
end
