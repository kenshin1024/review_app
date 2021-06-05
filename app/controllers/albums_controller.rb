class AlbumsController < ApplicationController
  before_action :authenticate_user!
  def show
    get_artist
    get_album
    @songs = @album.songs.order(id: "DESC")
    @song = Song.new
  end


  def create
    album = Album.create(album_params)
    render json: {album: album}
  end

  def edit
    get_artist
    get_album
  end

  def update
    get_artist
    get_album
    @album.update(album_params)
    redirect_to artist_path(@artist.id)
  end

  def destroy
    get_artist
    get_album
    @album.destroy
    redirect_to artist_path(@artist.id)
  end

  private 

  def album_params
    params.require(:album).permit(:title).merge(artist_id: params[:artist_id])
  end

  def get_artist
    @artist = Artist.find(params[:artist_id])
  end

  def get_album
    @album = Album.find(params[:id])
  end
end
