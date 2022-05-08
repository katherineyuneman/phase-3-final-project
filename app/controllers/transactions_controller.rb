class TransactionsController < ApplicationController

    get '/transactions' do
        @budget_transactions = Transaction.all.order(:created_at)
        @budget_transactions.to_json(include: [:budget, :category])
    end

    post '/transactions' do
        @transaction = Transaction.create(
            description: params[:description],
            amount: params[:amount].to_f,
            # date_created: params[:date_created],
            category_id: params[:category_id],
            budget_id: params[:budget_id]
        )
        @transaction.to_json
    end

    get '/budgets/:id/:month/transactions' do
        @transactions_budget = Transaction.where(:budget_id => params[:id])
        @transactions_budget.to_json
    end

    get '/budgets/:id/:month/transactions/sum' do
        transactions_sum
    end

    private
    def transactions_sum
        @transactions_budget_sum = Transaction.where(:budget_id => params[:id]).sum(:amount)
        @transactions_budget_sum.to_json
    end

end