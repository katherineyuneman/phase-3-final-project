class UsersController < ApplicationController
    
    get '/users' do
        users = User.all
        users.to_json
    end
    
    
    post '/users' do
        user = User.create(
            first_name: params[:first_name],
            last_name: params[:last_name],
            email: params[:email]
        )
        if user.save
            user.to_json
        else
            user.errors.full_messages.to_sentence
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
        user = User.find(params['id'])
        rescue ActiveRecord::RecordNotFound => e 
            {errors: e}.to_json
        end

    end

    patch '/users/:id' do
        user =User.find_by_id(params['id'])
        if user && user.update(params)
            user.to_json
        elsif !user
            {errors: "Record not found with id #{params['id']}"}.to_json
        else
            user.errors.full_messages.to_sentence
        end
    end

end