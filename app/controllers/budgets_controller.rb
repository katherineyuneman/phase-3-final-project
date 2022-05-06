class BudgetsController < ApplicationController

    get '/budgets' do
        @budgets = Budget.all
        @budgets.to_json(include: :month)
    end

    post '/budgets' do
        @budget = Budget.create(params)
        if @budget.id
            @budget.to_json
        else {errors: @budget.errors.full_messages.to_sentence}.to_json
        end
    end

    get '/budgets/:id' do
        budget  = Budget.find(params[:id])
        budget.to_json(include: :month)
      end

    delete '/budgets/:id' do
        budget = Budget.find(params[:id])
        budget.destroy
        budget.to_json
    end
 
    get '/budgets/:id/:month/transactions' do
        @transactions_budget = Transaction.where(:budget_id => params[:id])
        @transactions_budget.to_json
    end

    get '/budgets/:id/:month/transactions/sum' do
        @transactions_budget_sum = Transaction.where(:budget_id => params[:id]).sum(:amount)
        @transactions_budget_sum.to_json
    end

    private
    def find_budgets
        @budget = Budget.find_by_id(params['id'])
    end

end


# Budget.all.joins("INNER JOIN months ON months.month_id = months_id")