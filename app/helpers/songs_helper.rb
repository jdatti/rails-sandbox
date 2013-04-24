module SongsHelper

  def user_songs
    @user = current_user
    @songs = @user.songs
  end
end
