
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :method_override, true
  end

  get '/' do
      erb :index
  end

  get '/posts' do
      @posts = Post.all
      erb :index
  end

  post "/posts" do
      name = params[:name]
      content = params[:content]
      @post = Post.create(name: name,content: content)
      redirect "/posts"
  end

  get "/posts/new" do
      erb :new
  end

  get "/posts/:id" do
      @post = Post.find(params[:id])
      # binding.pry
      erb :show
  end

  patch "/posts/:id" do
      post = Post.find(params[:id])
      # binding.pry
      post.name = params[:name]
      post.content = params[:content]
      post.save

    redirect "posts/#{post.id}"
  end

  get "/posts/:id/edit" do
      @post = Post.find(params[:id])
      # binding.pry
      erb :edit
  end

  delete "/posts/:id/delete" do
      post = Post.find(params[:id])
      post.destroy
      redirect "/posts"

  end

end
