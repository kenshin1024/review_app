class ArtistsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_artist, except: [:index, :create]
  before_action :move_to_index, except: [:index, :create]
 
  def index
    @artists = Artist.where(user_id: current_user.id).order(id: "DESC")
    @artist = Artist.new
  end

  def create
  artist = Artist.create(artist_params)
    render json: { artist: artist}
  end

  def show
    @albums = @artist.albums.order(id: "DESC")
    @album = Album.new
  end

  def edit
  end

  def destroy
    @artist.destroy
    redirect_to root_path
  end

  def update
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

  def move_to_index
    if current_user.id != @artist.user_id
    redirect_to root_path
    end
  end
end
