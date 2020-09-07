class AlbumsController < ApplicationController
  def new
    @album = Album.new
  end

  def index
    @albums = Album.all
  end

  def edit
    @album = Album.find(params[:id])
  end

  def unfavorite
    album = Album.find(params[:id])
    if current_user.favorites.find_by(favoritable: album).destroy
      redirect_to album_path(album), notice: "Removed that from favorites!"
    else
      redirect_to album_path(album), error: "Error removing favorite album!"
    end
  end

  def favorite
    album = Album.find(params[:id])
    if current_user.favorites.create(favoritable: album)
      redirect_to album_path(album), notice: "Favorited!"
    else
      redirect_to album_path(album), error: "Error favoriting album!"
    end
  end

  def update
    @album = Album.find(params[:id])
    album_params = params.require(:album).permit(:artist, :title, :genre, :label, :year, :comments)
    if @album.update(album_params)
      redirect_to album_path(@album), notice: "Successfully updated album"
    else
      flash[:error] = "Error updating album"
      render :edit
    end
  end

  def create
    album_params = params.require(:album).permit(:artist, :title, :genre, :label, :year, :comments)
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_path(@album), notice: "Successfully created album"
    else
      flash[:error] = "Error creating album"
      render :new
    end
  end

  def show
    @album = Album.find(params[:id])
  end
end
