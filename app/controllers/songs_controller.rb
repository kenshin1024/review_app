class SongsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    song = Song.create(song_params)
    render json: {song: song}
  end

  def show
    get_song
  end

  def edit
    get_artist
    get_album
    get_song
  end

  def update
    get_artist
    get_album
    get_song
    @song.update(song_params)
    redirect_to artist_album_path(@artist.id,@album.id)
  end

  def destroy
    get_artist
    get_album
    get_song
    @song.destroy
    redirect_to artist_album_path(@artist.id,@album.id)
  end

  private
  def song_params
    params.require(:song).permit(:title,:star).merge(album_id: params[:album_id])
  end
 
  def get_artist
    @artist = Artist.find(params[:artist_id])
  end

  def get_album
    @album = Album.find(params[:album_id])
  end
  
  def get_song
    @song = Song.find(params[:id])
  end
end
