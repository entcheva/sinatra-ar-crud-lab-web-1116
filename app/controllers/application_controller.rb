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
    @post = Post.create(params[:name], params[:content])
    erb :index
  end


  # READ A POST
  get '/posts' do
    Post.all
    erb :index
  end

  # READ
  get '/posts/:id' do
    # display a specific post
    erb :show
    # The get '/posts/:id' controller action handles requests for a given instance of your post. For example, if a user types in www.yourwebsite.com/posts/2, this route will catch that request and get the id number, in this case 2, from the params. It will then find the instance of the post with that id number and set it equal to an instance variable: @post = Model.find(params[:id]). Finally, it will render the show.erb view page.
  end

  # UPDATE
  get '/posts/:id/edit' do
    # edit a specific post (take in the edit)
    erb :edit
  end

  # UPDATE
  patch '/posts/:id' do
    # execute the edit
  end

  # DELETE
  delete '/posts/:id/delete' do
    # delete the specific post
    # include button on the show erb view
  end









end
