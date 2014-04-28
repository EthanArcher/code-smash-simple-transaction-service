class Sale < ActiveRecord::Base
  attr_accessible :items, :total
  serialize :items

  validates :total, presence: true
  validates :items, presence: true
end
