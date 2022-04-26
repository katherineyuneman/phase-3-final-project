class UsersController < ApplicationController
    
    get '/users' do
        users = User.all
        users.to_json
    end
    
    
    post '/users' do
        @user = User.create(
            first_name: params[:first_name],
            last_name: params[:last_name],
            email: params[:email]
        )
        @user.to_json
    end

end