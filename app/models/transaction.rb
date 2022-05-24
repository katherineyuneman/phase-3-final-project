class Transaction < ActiveRecord::Base
    belongs_to :budget
    belongs_to :category

    validates :description, length: { maximum: 60 }, presence: true
    validates :amount, numericality: {greater_than: 0, message: ": Please only include numbers - no special $ characters." }
    validates :category_id, presence: { message: ": Please select a category." }
    validates :budget_id, presence: { message: ": Please select a Budget month." }
    
    # accepts_nested_attributes_for :budget

    def self.budget_select
      self.joins(budget: :month).joins(:category).select(
          'transactions.description','transactions.id as id', 'budgets.id as budget_id', 'transactions.amount',
          'transactions.created_at', 'months.month_desc', 'months.year', 'categories.description as category_description')
    end

end