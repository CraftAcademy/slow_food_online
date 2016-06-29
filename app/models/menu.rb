class Menu < ActiveRecord::Base
  has_many :dishes
  belongs_to :restaurant
end
