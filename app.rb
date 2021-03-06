# in app.rb

require 'sinatra/base'
require 'sinatra/reloader'
require './lib/player'


class Battle < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  
  get '/' do
    erb(:index)
  end

  post '/names' do
    $player_1 = Player.new(params[:player_1])
    $player_2 = Player.new(params[:player_2])
    
    redirect '/play'
  end

  get '/play' do
    @player_1 = $player_1.name
    @player_2 = $player_2.name
    @hitpoints_2 = $player_2.hitpoints
    @hitpoints_1 = $player_1.hitpoints
    erb(:play)
  end

  get '/attack' do
    $player_2.hitpoints -= 10
    redirect '/play'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end