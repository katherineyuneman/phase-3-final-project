class BudgetsController < ApplicationController

    get '/budgets' do
        @budgets = Budget.includes(:month).order("months.month_num ASC")
        @budgets.to_json(include: :month)
    end

    post '/budgets' do
        @budget = Budget.create(month_id: params[:month_id], amount: params[:amount].to_i, user_id: params[:user_id])
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

    get '/budgetsummary/:month_desc' do
        budget_summary_by_month
    end

    private
    def find_budgets
        @budget = Budget.find_by_id(params['id'])
    end
    
    def budget_summary_by_month
        month_desc_param = Month.find_by_month_desc(params[:month_desc])
        month_id_param = month_desc_param.id
        budget = Budget.find_by_month_id(month_id_param)
        budget.to_json(include: :month)
    end

end


# Budget.all.joins("INNER JOIN months ON months.month_id = months_id")