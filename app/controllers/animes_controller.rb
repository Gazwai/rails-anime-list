class AnimesController < ApplicationController
  before_action :set_anime, only: [ :show]

  def index
    @top_anime = Anime.order(ranking: :asc).limit(50)
  end

  def show
    service = JikanApiService.new()

    @data = service.fetch_data("/v4/anime/#{@anime.mal_id}/full", { })["data"]

  rescue StandardError => e
    render json: { error: e.message }, status: :bad_request
  end

  private

  def set_anime
    @anime = Anime.find(params[:id])
  end
end
