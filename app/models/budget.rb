class Budget < ActiveRecord::Base
    has_many :transactions, dependent: :destroy
    belongs_to :month
    belongs_to :user
    validates :month_id, presence: true, uniqueness: true

    accepts_nested_attributes_for :month

  end

