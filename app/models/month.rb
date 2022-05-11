class Month < ActiveRecord::Base
  has_one :budget
  has_many :transactions, through: :budget

  accepts_nested_attributes_for :budget, :transactions

  end