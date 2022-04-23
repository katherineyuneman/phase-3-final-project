class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.string :description
      t.decimal :amount
      t.date :date_created
      t.integer :category_id
      t.integer :budget_id
    end
  end
end
