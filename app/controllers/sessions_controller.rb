class SessionsController < ApplicationController
    # set :default_content_type, 'application/json'

    get '/login' do
        @logged_in_user = User
        @logged_in_user.to_json
    end

    post "/login" do
        user = User.find_by(:email => params[:email])
        if user&.authenticate(params[:password_digest])
            session[:user_id] = user.id #save user id into server memory
            halt 200, {user: user, message: "User successfully logged in"}.to_json
        else
            halt 404, {error: "Invalid Credentials!"}.to_json
        end
    end

    delete "/logout" do
        session.delete("user_id")
        {message: "User successfully logged out!"}.to_json
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