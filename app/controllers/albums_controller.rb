class AlbumsController < ApplicationController
  
  def show
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
