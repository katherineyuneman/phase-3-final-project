class UsersController < ApplicationController
    
    get '/users' do
        @users = User.all
        @users.to_json
    end
    
    
    post '/users' do
        @user = User.create(params)
        if @user.id
            session[:user_id] = user.id
            serialized_user
        else
            @user.errors.full_messages.to_sentence
        end
    end

    get '/users/:id'do
        # user = User.find_by(id: params["id"])
        # if user
        #     user.to_json
        # else
        #     {errors: "Record not found, try again with another id!"}.to_json
        # end

        ###OR

        begin
            find_user.to_json
        rescue ActiveRecord::RecordNotFound => e 
            {errors: e}.to_json
        end

    end

    patch '/users/:id' do
        find_user
        if @user && @user.update(params)
            @user.to_json
        elsif !@user
            {errors: "Record not found with id #{params['id']}"}.to_json
        else
            @user.errors.full_messages.to_sentence
        end
    end

private
    def find_user
        @user =User.find_by_id(params['id'])
    end

end