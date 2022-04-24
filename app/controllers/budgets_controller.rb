class BudgetsController < ApplicationController

    get '/budgets' do
        @budgets = Budget.all
        @budgets.to_json(include: [:user])
    end

    post '/budgets' do
        budget = Budget.create(
            amount: params[:amount],
            month: params[:month],
            user_id: params[:user_id]
        )
        budget.to_json
    end

    delete '/budgets/:id' do
        budget = Budget.find(params[:id])
        budget.destroy
        budget.to_json
    end

    private
    def find_budgets
        @budget = Budget.find_by_id(params[:id])
    end

end