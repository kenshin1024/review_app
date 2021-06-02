class ArtistsController < ApplicationController
  def index
    @artists = Artist.order(id: "DESC")
  end

  def create
  artist = Artist.create(title: params[:title])
    render json: { artist: artist}
  end
end
