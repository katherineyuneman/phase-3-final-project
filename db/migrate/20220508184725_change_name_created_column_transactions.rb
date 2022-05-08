class ChangeNameCreatedColumnTransactions < ActiveRecord::Migration[6.1]
  def change

    change_column :transactions, :date_created, :datetime

    change_table :transactions do |t|
      t.rename :date_created, :created_at
    end
  end
end
