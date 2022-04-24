class BudgetsController < ApplicationController

    get '/budgets' do
        @budgets = Budget.all
        @budgets.to_json(include: [:user])
    end

    get '/transactions' do
        @budget_transactions = Transaction.all
        @budget_transactions.to_json
    end

    private
    def find_budgets
        @budget = Budget.find_by_id(params[:id])
    end

end