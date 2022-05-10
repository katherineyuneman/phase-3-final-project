class TransactionsController < ApplicationController

    get '/transactions' do
        @budget_transactions = Transaction.all.order(created_at: :asc)
        @budget_transactions.to_json(include: [:budget, :category])
    end

    get '/transactions/recent' do
        @transaction_summary = Transaction.all.order(created_at: :desc).last(5)
        @transaction_summary.to_json(include: [:budget, :category])
    end

    post '/transactions' do
        @transaction = Transaction.create(
            description: params[:description],
            amount: params[:amount].to_f,
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

    delete '/transactions/:id' do
        transaction = Transaction.find(params[:id])
        transaction.destroy
        transaction.to_json
      end

    private
    def transactions_sum
        @transactions_budget_sum = Transaction.where(:budget_id => params[:id]).sum(:amount)
        @transactions_budget_sum.to_json
    end
    

end