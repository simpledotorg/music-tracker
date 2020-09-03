class AlbumsController < ApplicationController
  def new
    @album = Album.new
  end

  def index
    @albums = Album.all
  end

  def create
    album_params = params.permit(:title, :genre, :label, :year, :comments)
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_path(@album), notice: "Successfully created album"
    else
      flash[:error] = "Error creating album"
      render
    end

  end
end
