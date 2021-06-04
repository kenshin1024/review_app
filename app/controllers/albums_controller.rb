class AlbumsController < ApplicationController
  before_action :authenticate_user!
  def show
    @artist = Artist.find(params[:artist_id])
    @album = Album.find(params[:id])
    @songs = @album.songs.order(id: "DESC")
    @song = Song.new
  end


  def create
    album = Album.create(album_params)
    render json: {album: album}
  end

  def edit
    @album = Album.find(params[:id])
  end

  def destroy
  end

  private 

  def album_params
    params.require(:album).permit(:title).merge(artist_id: params[:artist_id])
  end
end
