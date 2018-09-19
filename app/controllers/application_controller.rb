
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end


#CREATE
    get '/posts/new' do
      erb :new
    end

    get '/posts' do
      @posts = Post.all
      erb :index
    end

    post '/posts' do
       name = params[:name]
       content = params[:content]

       post = Post.create(name: name, content: content)
       redirect "/posts/#{id}"
    end

#READ
    get '/posts' do
      @posts = Post.all
      erb :index
    end

    get '/posts/:id' do
      @post = Post.find(params[:id])
      erb :show
    end


#UPDATE

    get '/posts/:id/edit' do
      @post = Post.find(params[:id])
      erb :edit
    end

    patch '/posts/:id' do
      @post = Post.find(params[:id])
      @post.name = params[:name]
      @post.content = params[:content]
      @post.save
      redirect "/posts/#{post.id}"
    end


#DELETE
    delete '/posts/:id/delete' do
      @post = Post.find(params[:id])
      erb :delete
    end

end
