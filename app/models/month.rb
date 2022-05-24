class Month < ActiveRecord::Base
  has_one :budget
  
  end