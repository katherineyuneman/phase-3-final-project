class User < ActiveRecord::Base
    has_many :budgets
  end