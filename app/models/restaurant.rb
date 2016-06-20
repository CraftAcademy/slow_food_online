class Restaurant < ActiveRecord::Base
  belongs_to :restaurant_category

  validates_presence_of :name
  validates_uniqueness_of :name

  validates_presence_of :restaurant_category
end
