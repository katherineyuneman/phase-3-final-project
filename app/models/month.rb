class Month < ActiveRecord::Base
  has_one :budget
  accepts_nested_attributes_for :budget

  end