class Transaction < ActiveRecord::Base
    belongs_to :budget
    belongs_to :category

  end