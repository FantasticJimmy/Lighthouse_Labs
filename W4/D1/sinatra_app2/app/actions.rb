# Homepage (Root path)
helpers do
  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def sorting_the_songs_by_votes
    Song.all.joins('LEFT JOIN upvotes ON (songs.id = upvotes.song_id)').group("songs.id").order("count(upvotes.song_id) DESC")
  end
  # def youtube_link?(song)
  #   binding.pry
  #   /youtube\.com/.match(song.url)
  # end
end


get '/users/login' do
  @verify = true
  erb :'/users/user_login'
end

post '/users/login' do
  @user  = User.find_by(name: params[:username])
  @verify = @user && @user.password.to_s == params[:password]
  if @verify
    session[:user_id] = @user.id
    redirect '/users'
  else
    erb :'/users/user_login'
  end
end

get '/users/logout' do
  session[:user_id] = nil
  redirect '/'
end

get '/users/signup' do
  erb :'/users/user_signup'
end

post '/users' do
  @user = User.new(name: params[:username],
                   password: params[:password])
  if @user.save
    session[:user_id] = @user.id
    redirect '/users'
  else
    erb :'/users/user_signup'
  end
end

get '/users' do
  session[:user_id] ||= nil
  @user = current_user
  if @user
    @songs = Song.all.joins('LEFT JOIN upvotes ON (songs.id = upvotes.song_id)').group("songs.id").order("count(upvotes.song_id) DESC")
    erb :'/users/users'
  else
    redirect '/users/login'
  end
end


get '/' do
  erb :index
end

get '/users/show_all_songs' do
  redirect '/users'
end

get '/songs/:id' do
  @user = current_user
  if @user
    @song = Song.all.find(params[:id])
    @comments = @song.comments.all
    erb :'/songs/song_detail'
  else
    redirect '/users/login'
  end
end

post '/songs/:id' do
  if (Comment.where(song_id: params[:id]).any?{|comment|comment.user_id == current_user.id})
    redirect "/songs/#{params[:id]}"
  else
    Comment.create(comment: params[:comment],
    song_id: params[:id],
    user_id: current_user.id
    )
    Rating.create(rating_point: params[:your_awesome_parameter],
    song_id: params[:id],
    user_id: current_user.id
      )
    redirect "/songs/#{params[:id]}"
  end
end

get '/artists/:artist' do 
  song_by_id = Song.find_by(artist: params[:artist])
  @user = current_user
  if @user
    @song = sorting_the_songs_by_votes.where(artist: song_by_id.artist)
    erb :'/show_all_songs_of_this_artist'
  else
    redirect '/users/login'
  end
end

get '/users/add_new_song' do
  if current_user
    erb :'/users/user_new_song'
  else
    redirect '/users/login'
  end
end

post '/users/add_new_song' do
    Song.create(title: params[:title] ,artist: params[:artist] ,url: params[:url], user_id: current_user.id)
    redirect '/users'
end

get '/songs/upvote/:id' do
  if current_user
    song_by_id = Song.find(params[:id])
    unless current_user.upvotes.find_by(song_id: song_by_id.id)
      Upvote.create(user_id: current_user.id,song_id: song_by_id.id)
      redirect '/users' 
    else
      redirect '/users'
    end
  else 
    redirect '/users/login'
  end
end

get '/songs/current_user_delete_comment/:id' do
  song = Comment.find(params[:id]).song
  Comment.find(params[:id]).delete
  redirect "/songs/#{song.id}"
end

get '/users/profile' do
  erb :'/users/user_profile'
end










