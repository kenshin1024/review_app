class ArtistsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @artists = Artist.where(user_id: current_user.id).order(id: "DESC")
    @artist = Artist.new
  end

  def create
  artist = Artist.create(artist_params)
    render json: { artist: artist}
  end

  def show
    get_artist
    @albums = @artist.albums.order(id: "DESC")
    @album = Album.new
  end

  def edit
    get_artist
  end

  def destroy
    get_artist
    @artist.destroy
    redirect_to root_path
  end

  def update
    get_artist
    @artist.update(artist_params)
    redirect_to root_path
  end

  private

  def artist_params
    params.require(:artist).permit(:title).merge(user_id: current_user.id)
  end


  def get_artist
    @artist = Artist.find(params[:id])
  end
end
