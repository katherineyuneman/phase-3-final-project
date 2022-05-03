class ChangeMonthDatatypeBudgets < ActiveRecord::Migration[6.1]
  def change
    change_column :budgets, :month_id, :integer
  end
end
