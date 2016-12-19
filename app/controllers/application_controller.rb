require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # CREATE A POST
  get 'posts/new' do
    erb :new
  end

  post '/posts' do
    @post = Post.create(:name => params[:name], :content => params[:content])
    redirect to '/posts/'
  end

  # READ ALL POSTS
  get '/posts' do
    @posts = Post.all
    erb :index
  end

  # READ ONE POST
  get '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    erb :show
  end

  # UPDATE
  get '/posts/:id/edit' do
    @post = Post.find_by_id(params[:id])
    erb :edit
  end

  # UPDATE
  patch '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    redirect to "/posts/#{@post.id}"
  end

  # DELETE
  delete '/posts/:id/delete' do
    # delete the specific post
    # include button on the show erb view
  end









end
