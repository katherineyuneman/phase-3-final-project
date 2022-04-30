class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  set :session_secret, ENV["SESSION_SECRET"]
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  get '/categories' do
    categories = Category.all
    categories.to_json
  end

end
