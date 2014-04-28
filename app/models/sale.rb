class Sale < ActiveRecord::Base
  attr_accessible :items, :total
  serialize :items

  validates :total, presence: true
  validates :items, presence: true

  # This is purely for teaching purposes, this is normally undesirable
  def save(*args)
    save!(*args)
  end

  def self.create(*args)
    create!(*args)
  end
end
