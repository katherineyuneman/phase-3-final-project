class Budget < ActiveRecord::Base
    has_many :transactions, dependent: :destroy
    belongs_to :month
    belongs_to :user
    validates :month_id, presence: true, uniqueness: true
    validates :amount, numericality: {greater_than: 0, message: ": Please only include numbers - no special $ characters." }
    

    def self.instance_budget
      binding.pry
    end



  end