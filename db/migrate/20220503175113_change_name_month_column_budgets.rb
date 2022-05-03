class ChangeNameMonthColumnBudgets < ActiveRecord::Migration[6.1]
  def change
    change_table :budgets do |t|
      t.rename :month, :month_id
    end
  end
end
