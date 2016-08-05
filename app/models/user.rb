class User < ActiveRecord::Base
  PERMITTED_ROLES = %w(customer admin restaurant_owner)

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable

  include DeviseTokenAuth::Concerns::User


  has_one :restaurant
  has_many :orders

  validates_presence_of :username
  validates_uniqueness_of :username
  validates_presence_of :role
  validates :role, inclusion: { in: PERMITTED_ROLES,
                               message: '%{value} is not permitted'}
  validates_format_of :email, with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
  validates_format_of :cvc, with: /\A(\d{3})\z/, allow_blank: true
  def admin?
    self.role == 'admin'
  end

  def rest_owner?
    self.role == 'restaurant_owner'
  end
end
