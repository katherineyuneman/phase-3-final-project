class Month < ActiveRecord::Base
  has_one :budget


  def self.month_desc_conversion(month_desc)
    month_desc = self.find_by_month_desc(month_desc).id
  end

  end