require 'sinatra/base'
require_relative 'data_mapper_setup.rb'

class Bookmark_manager < Sinatra::Base
set :views, proc { File.join(root, '..', 'views') }

  get '/' do
    dredirect '/links'
    erb :'links/home'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
     erb :'links/new'
  end

  post '/links' do
    Link.create(url: params[:url], title: params[:title])
    redirect to ('/links')
  end



  # start the server if ruby file executed directly
  run! if app_file == $0
end
