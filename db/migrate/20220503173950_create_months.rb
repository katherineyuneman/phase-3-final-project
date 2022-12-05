class CreateMonths < ActiveRecord::Migration[6.1]
  def change
    create_table :months do |t|
      t.string :month_num
      t.string :month_desc
      t.integer :year
    end
  end
end


