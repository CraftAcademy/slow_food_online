class Restaurant < ActiveRecord::Base
  belongs_to :restaurant_category
  belongs_to :user
  has_many :menu
  validates_presence_of :name
  validates_uniqueness_of :name

  validates_presence_of :restaurant_category

  geocoded_by :full_street_address
  after_validation :geocode

  def full_street_address
    self.address
  end
end
