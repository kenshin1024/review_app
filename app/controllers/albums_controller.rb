class AlbumsController < ApplicationController
  
  def show
    @album = Album.new
    @albums = Artist.find(params[:artist_id]).albums.order.(id: "DESC")
  end


  def create
    album = Album.create(album_params)
    render json: {album: album}
  end

  private 

  def album_params
    params.require(:album).permit(:title).merge(artist_id: params[:artist_id])
  end
end
