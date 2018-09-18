
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/posts/new' do
    erb :new
  end

  post "/posts" do
    @post = Post.create(params)
    redirect "/posts"
  end

  get "/posts" do
    @posts = Post.all
    erb :index
  end

  get "/posts/:id" do
    @post = Post.find(params[:id])
    erb :show
  end

  get "/posts/:id/edit" do
    @post = Post.find(params[:id])
    erb :edit
  end

  patch "/posts/:id" do
    # binding.pry

    post = Post.find(params[:id])
    post.update(name: params[:name], content: params[:content])

    redirec "posts/#{posts.id}"
  end

  delete '/posts/:id/delete' do

    post = Post.find(params[:id])
    post.destroy
    redirect "/posts"
  end






end
