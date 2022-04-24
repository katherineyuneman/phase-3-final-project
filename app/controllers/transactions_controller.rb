class TransactionsController < ApplicationController

    get '/transactions' do
        @budget_transactions = Transaction.all
        @budget_transactions.to_json
    end

end