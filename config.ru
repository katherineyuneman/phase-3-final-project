require_relative "./config/environment"

# Allow CORS (Cross-Origin Resource Sharing) requests
use Rack::Cors do
  allow do
    origins '*'
    resource '/login',
      headers: :any,
      methods: [:post]
    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
    
  end
end

# Parse JSON from the request body into the params hash
use Rack::JSONBodyParser

# Our application
use BudgetsController
use TransactionsController
use UsersController
use SessionsController
run ApplicationController