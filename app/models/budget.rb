class Budget < ActiveRecord::Base
    has_many :transactions, dependent: :destroy
    has_many :months

    belongs_to :user

  end

