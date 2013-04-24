class SongsController < ApplicationController
  include SongsHelper
  
  before_filter :require_login, :except => [:search]
  
  def new
    @song = Song.new
  end

  def create
    @song = Song.new(params[:song])
    @song.user_id = session[:user_id]
    respond_to do |format|
      if @song.save
        format.html { redirect_to @song, notice: 'song was successfully saved.' }
        format.json { render json: @song, status: :created, location: @song }
      else
        format.html { render action: "new" }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @song = Song.find(params[:id])
  end

  def index
    user_songs
  end

  def search

  end
end
