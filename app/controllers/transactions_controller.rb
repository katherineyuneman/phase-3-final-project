class TransactionsController < ApplicationController

    get '/transactions' do
        budget_select
        @budget_transactions = @budget_select.order(created_at: :desc)
        @budget_transactions.to_json()

    end

    get '/transactions/recent' do
        @transaction_summary = Transaction.all.order(created_at: :desc).first(4)
        @transaction_summary.to_json(include: [:budget, :category])
    end

    post '/transactions' do
        transaction = Transaction.create(
            description: params[:description],
            amount: params[:amount].to_f,
            category_id: params[:category_id],
            budget_id: params[:budget_id]
        )
        if transaction.save
            transaction.to_json
        else
            {errors: transaction.errors.full_messages}.to_json
        end
    end

    get '/budgets/:id/:month/transactions' do
        budget_select
        @transactions_budget = @budget_select.where(:budget_id => params[:id])
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
    def budget_select
        @budget_select = Transaction.joins(budget: :month).joins(:category).select(
            'transactions.description','transactions.id as id', 'budgets.id as budget_id', 'transactions.amount',
            'transactions.created_at', 'months.month_desc', 'months.year', 'categories.description as category_description')
    end
    
    def transactions_sum
        @transactions_budget_sum = Transaction.where(:budget_id => params[:id]).sum(:amount)
        @transactions_budget_sum.to_json
    end

    
    

end