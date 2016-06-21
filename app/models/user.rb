class User < ActiveRecord::Base
  PERMITTED_ROLES = %w(customer admin restaurant_owner)

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :restaurant

  validates_presence_of :username
  validates_uniqueness_of :username
  validates_presence_of :role
  validates :role, inclusion: { in: PERMITTED_ROLES,
                               message: '%{value} is not permitted'}

  def admin?
    self.role == 'admin'
  end

  def rest_owner?
    self.role == 'restaurant_owner'
  end
end
