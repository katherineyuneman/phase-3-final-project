class BudgetsController < ApplicationController

    get '/budgets' do
        @budgets = Budget.all
        @budgets.to_json(include: [:user])
    end

    private
    def find_budgets
        @budget = Budget.find_by_id(params[:id])
    end

end