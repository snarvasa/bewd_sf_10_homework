class SongController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    @song = get_song
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to song_path(@song)
    else
      render 'new'
    end
  end

  def edit
    @song = get_song
  end

  def update
    @song = get_song

    if @song.update(song_params)
      redirect_to @song
    else
      render 'edit'
    end

  end

  def destroy
    @song = get_song
    @song.destroy

    redirect_to song_path
  end

  private

    def song_params
      params.require(:song).permit(:title, :length, :genre)
    end

    def get_song
      @song = Song.find(params[:id])
    end

end
