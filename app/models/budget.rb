class Budget < ActiveRecord::Base
    has_many :transactions, dependent: :destroy
    belongs_to :month
    belongs_to :user

  end

