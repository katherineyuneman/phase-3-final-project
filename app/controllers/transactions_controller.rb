class TransactionsController < ApplicationController

    get '/transactions' do
        @budget_transactions = Transaction.all
        @budget_transactions.to_json
    end

    post '/transactions' do
        @transaction = Transaction.create(
            description: params[:description],
            amount: params[:amount],
            date_created: params[:date_created],
            category_id: params[:category_id],
            budget_id: params[:budget_id]
        )
        @transaction.to_json
    end

end