class Transaction < ActiveRecord::Base
    belongs_to :budget
    belongs_to :category

    validates :description, length: { maximum: 60 }, presence: true
    validates :amount, numericality: {greater_than: 0, message: "Please only include numbers - no special $ characters." }
    validates :category_id, presence: { message: "Please select a category." }
    validates :budget_id, presence: { message: "Please select a Budget month." }
    accepts_nested_attributes_for :budget

end

  #   t.string "description"
  #   t.decimal "amount"
  #   t.datetime "created_at"
  #   t.integer "category_id"
  #   t.integer "budget_id"
  