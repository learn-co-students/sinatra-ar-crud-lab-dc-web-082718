
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end


  get '/posts/new' do #creates new post
    erb :new
  end

get '/posts' do #renders all saved posts - index.erb
  @posts = Post.all
  erb :index
end

post '/posts' do #upon submission saves ur stuff
  name = params[:name]
  content = params[:content]
  Post.create(name:name, content:content)
  redirect '/posts'
end


get '/posts/:id' do #renders specific post - show.erb
  post_id = params[:id]
  @post = Post.find(post_id)
  erb :show
end
get '/posts/:id/edit' do #renders and edits a specific post
  post_id = params[:id]
  @post = Post.find(post_id)
  erb :edit
 end

patch '/posts/:id' do
  post_id = params[:id]
  name = params[:name]
  content = params[:content]
  post = Post.find(post_id)
  post.name = name
  post.content = content
  post.save
  @post = post
redirect "/posts/#{post_id}"
end


delete '/posts/:id/delete' do
  post_id = params[:id]
@post = Post.find(post_id)
@post.delete
erb :delete
end







end
