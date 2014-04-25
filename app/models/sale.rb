class Sale < ActiveRecord::Base
  attr_accessible :items, :total
  serialize :items
end
