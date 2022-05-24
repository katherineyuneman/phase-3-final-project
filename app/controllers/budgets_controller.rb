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

    get '/budgetsummary/:month_desc' do
        budget = Budget.find_by_month_id(month_desc_conversion)
        budget.to_json(include: :month)
    end

    get '/budgetsummary/:month_desc/max_spend' do
        budget_id = Budget.find_by_month_id(month_desc_conversion).id
        max_spend = Transaction.where(:budget_id => budget_id).maximum(:amount)
        max_spend.to_json
    end


    get '/budgets/:id' do
        budget  = Budget.find(params[:id])
        budget.to_json(include: :month)
      end

    patch '/budgets/:id' do
        budget = Budget.find(params[:id])
        budget.update(params)
        budget.to_json(include: :month)
    end

    delete '/budgets/:id' do
        budget = Budget.find(params[:id])
        budget.destroy
        budget.to_json
    end

    private
    def month_desc_conversion
        Month.find_by_month_desc(params[:month_desc]).id
    end

end