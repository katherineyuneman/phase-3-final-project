class SessionsController < ApplicationController
    set :default_content_type, 'application/json'

    post "/login" do
        user = User.find_by_email(params[:email])

        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            halt 200, {user: user, message: "User successfully logged in"}
        else
            halt 404, {error: "Invalid Credentials!"}
        end
    end
    
    # # Add your routes here
    # get "/" do
    #   { message: "Good luck with your project!" }.to_json
    # end
  
    # get '/categories' do
    #   categories = Category.all
    #   categories.to_json
    # end
  
  end