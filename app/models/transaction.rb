class Transaction < ActiveRecord::Base
    belongs_to :budget
    belongs_to :category


    accepts_nested_attributes_for :budget

  end