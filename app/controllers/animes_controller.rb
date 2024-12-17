class AnimesController < ApplicationController
  allow_unauthenticated_access only: [ :index ]
  before_action :set_anime, only: [ :show]

  def index
    @top_anime = Anime.order(ranking: :asc).limit(50)
  end

  def show
  end

  private

  def set_anime
    @anime = Anime.find(params[:id])
  end
end
